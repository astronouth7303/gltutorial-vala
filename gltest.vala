using Gtk;
using GL;
using Gdk;

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

	private GLuint[] vtxary = {-1};
	private GLuint[] vtxbuf = {-1};

	private void init_render() {
		glewExperimental = GL_TRUE; 
		glewInit();

		glGenVertexArrays(1, vtxary);
		glBindVertexArray(vtxary[0]);

		
		// Generate 1 buffer, put the resulting identifier in vtxbuf
		glGenBuffers(1, vtxbuf);
		glBindBuffer(GL_ARRAY_BUFFER, vtxbuf[0]);
		// Give our vertices to OpenGL.
		glBufferData(GL_ARRAY_BUFFER, sizeof__g_vertex_buffer_data, (GLvoid[]?)g_vertex_buffer_data, GL_STATIC_DRAW);

		first = false;
	}

	private bool renderframe(GLContext ctx) {
		if (first) init_render();

		// 1rst attribute buffer : vertices
		glEnableVertexAttribArray(0);
		glBindBuffer(GL_ARRAY_BUFFER, vtxbuf[0]);
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