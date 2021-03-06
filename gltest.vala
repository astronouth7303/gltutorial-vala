using Gtk;
using GL;
using Gdk;
using Graphene;

string readstream(InputStream data) throws GLib.IOError {
	var dis = new DataInputStream(data);
	var sb = new StringBuilder();

	string line;
	while ((line = dis.read_line()) != null) {
		sb.append(line);
		sb.append("\n");
	}

	return sb.str;
}

errordomain GLCompileError {
	SHADER,
	PROGRAM
}

class AppWindow : Gtk.Window {
	public GLArea glarea {get; construct;}

	private bool first = true;

	construct {
		glarea = new GLArea();
		add(glarea);

		glarea.render.connect(renderframe);

		destroy.connect (() => {
			Gtk.main_quit ();
		});
	}

	static const GLfloat g_vertex_buffer_data[] = {
		-1.0f, -1.0f, 0.0f,
		1.0f, -1.0f, 0.0f,
		0.0f,  1.0f, 0.0f,
	};

	static const ulong sizeof__g_vertex_buffer_data = sizeof(GLfloat) * 9;

	private GLuint vertexarray = -1;
	private GLuint vertexbuffer = -1;

	private GLuint programID = -1;

	private Matrix MVP;
	private GLint MatrixID = -1;

	private void init_render() {
		try {
			glewExperimental = GL_TRUE; 
			glewInit();

			GLuint[1] vtxary = {vertexarray};
			GLuint[1] vtxbuf = {vertexbuffer};

			glGenVertexArrays(1, vtxary);
			vertexarray = vtxary[0];
			glBindVertexArray(vertexarray);

			
			// Generate 1 buffer, put the resulting identifier in vtxbuf
			glGenBuffers(1, vtxbuf);
			vertexbuffer = vtxbuf[0];
			glBindBuffer(GL_ARRAY_BUFFER, vertexbuffer);
			// Give our vertices to OpenGL.
			glBufferData(GL_ARRAY_BUFFER, sizeof__g_vertex_buffer_data, (GLvoid[]?)g_vertex_buffer_data, GL_STATIC_DRAW);

			programID = load_shaders("/com/astro73/Spacers/vertex.glsl", "/com/astro73/Spacers/fragment.glsl");

			// Get a handle for our "MVP" uniform
			MatrixID = glGetUniformLocation(programID, "MVP");
			// Projection matrix : 45° Field of View, 4:3 ratio, display range : 0.1 unit <-> 100 units
			var Projection = Matrix();
			Projection.init_perspective(0.785398f, 4.0f / 3.0f, 0.1f, 100.0f);
			
			var View_location = Vec3();
			View_location.init(4,3,3); // Camera is at (4,3,3), in World Space
			var View_look_at = Vec3();
			View_look_at.init(0,0,0); // and looks at the origin
			var View_up = Vec3();
			View_up.init(0,1,0); // Head is up (set to 0,-1,0 to look upside-down)
			var View = Matrix();
			View.init_look_at(View_location, View_look_at, View_up);

			var Model = Matrix();
			Model.init_identity();

			MVP = Projection.multiply(View).multiply(Model);

			stdout.printf("XYZ scale: %f %f %f\n", MVP.get_x_scale(), MVP.get_y_scale(), MVP.get_z_scale());

			stdout.printf("Finished init\n");
		} finally {
			first = false;
		}
	}

	private GLuint load_shaders(string vertex_name, string fragment_name) throws GLib.Error, GLCompileError {
		stdout.printf("Compiling vertex shader : %s\n", vertex_name);
		GLuint VertexShaderID = compile_shader(GL_VERTEX_SHADER, vertex_name);

		stdout.printf("Compiling fragment shader : %s\n", fragment_name);
		GLuint FragmentShaderID = compile_shader(GL_FRAGMENT_SHADER, fragment_name);

		stdout.printf("Linking program\n");

		GLuint ProgramID = glCreateProgram();
		glAttachShader(ProgramID, VertexShaderID);
		glAttachShader(ProgramID, FragmentShaderID);
		glLinkProgram(ProgramID);
		GLint[] Results = {-1};
		int[] InfoLogLength = {-1};
		glGetProgramiv(ProgramID, GL_LINK_STATUS, Results);
		glGetProgramiv(ProgramID, GL_INFO_LOG_LENGTH, InfoLogLength);
		stderr.printf("Link: %i %i\n", Results[0], InfoLogLength[0]);
		if (Results[0] != GL_TRUE) {
			string infolog = "";
			if ( InfoLogLength[0] > 0 ){
				ByteArray infobuf = new ByteArray.sized(InfoLogLength[0]+1);
				glGetProgramInfoLog(ProgramID, InfoLogLength[0], null, infobuf.data);
				infolog = (string)infobuf.data;
				stderr.printf("Error: %s\n", infolog);
			}
			throw new GLCompileError.PROGRAM(infolog);
		}

		glDetachShader(ProgramID, VertexShaderID);
		glDetachShader(ProgramID, FragmentShaderID);
		
		glDeleteShader(VertexShaderID);
		glDeleteShader(FragmentShaderID);

		return ProgramID;
	}

	private GLuint compile_shader(GL.GLenum type, string resource) throws GLib.Error, GLCompileError {
		GLuint shid = glCreateShader(type);

		string shadersource = readstream(resources_open_stream(resource, ResourceLookupFlags.NONE));
		glShaderSource(shid, 1, {shadersource}, null);
		glCompileShader(shid);

		GLint[] Results = {-1};
		int[] InfoLogLength = {-1};
		glGetShaderiv(shid, GL_COMPILE_STATUS, Results);
		glGetShaderiv(shid, GL_INFO_LOG_LENGTH, InfoLogLength);
		if (Results[0] != GL_TRUE) {
			string infolog = "";
			if ( InfoLogLength[0] > 0 ){
				ByteArray infobuffer = new ByteArray.sized(InfoLogLength[0]+1);
				glGetShaderInfoLog(shid, InfoLogLength[0], null, infobuffer.data);
				infolog = (string)infobuffer.data;
			}
			throw new GLCompileError.SHADER(infolog);
		}			

		return shid;
	}

	private bool renderframe(GLContext ctx) {
		if (first) init_render();

		glClearColor(0.0f, 0.0f, 0.4f, 0.0f);
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

		if (programID == -1) return false;

		glUseProgram(programID);

		// Send our transformation to the currently bound shader, 
		// in the "MVP" uniform
		float m[4*4];
		MVP.to_float(out m);
		glUniformMatrix4fv(MatrixID, 1, GL_FALSE, m);

		// 1st attribute buffer : vertices
		glEnableVertexAttribArray(0);
		glBindBuffer(GL_ARRAY_BUFFER, vertexbuffer);
		glVertexAttribPointer(
		   0,                  // attribute 0. No particular reason for 0, but must match the layout in the shader.
		   3,                  // size
		   GL_FLOAT,           // type
		   GL_FALSE,           // normalized?
		   0,                  // stride
		   (GLvoid[])0            // array buffer offset
		);
		// Draw the triangle !
		glDrawArrays(GL_TRIANGLES, 0, 3); // Starting from vertex 0; 3 vertices total -> 1 triangle
		glDisableVertexAttribArray(0);
		return false;
	}
}

public static int main (string[] args) {
	Gtk.init (ref args);

	AppWindow app = new AppWindow();
	app.show_all();
	Gtk.main();
	return 0;
}
