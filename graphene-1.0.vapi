/* graphene-1.0.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Graphene", gir_namespace = "Graphene", gir_version = "1.0", lower_case_cprefix = "graphene_")]
namespace Graphene {
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_box_t", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "graphene_box_get_type ()")]
	[Compact]
	public class Box {
		[CCode (cname = "graphene_box_alloc", has_construct_function = false)]
		public Box.alloc ();
		public bool contains_box (Graphene.Box b);
		public bool contains_point (Graphene.Point3D point);
		public static unowned Graphene.Box empty ();
		public bool equal (Graphene.Box b);
		public void expand (Graphene.Point3D point, out unowned Graphene.Box res);
		public void expand_scalar (float scalar, out unowned Graphene.Box res);
		public void expand_vec3 (Graphene.Vec3 vec, out unowned Graphene.Box res);
		public void free ();
		public void get_bounding_sphere (out unowned Graphene.Sphere sphere);
		public void get_center (out unowned Graphene.Point3D center);
		public float get_depth ();
		public float get_height ();
		public void get_max (out unowned Graphene.Point3D max);
		public void get_min (out unowned Graphene.Point3D min);
		public void get_size (out unowned Graphene.Vec3 size);
		public void get_vertices ([CCode (array_length = false)] out unowned Graphene.Vec3[] vertices);
		public float get_width ();
		public static unowned Graphene.Box infinite ();
		public unowned Graphene.Box init (Graphene.Point3D? min, Graphene.Point3D? max);
		public unowned Graphene.Box init_from_box (Graphene.Box src);
		public unowned Graphene.Box init_from_points ([CCode (array_length_cname = "n_points", array_length_pos = 0.5, array_length_type = "guint")] Graphene.Point3D[] points);
		public unowned Graphene.Box init_from_vec3 (Graphene.Vec3? min, Graphene.Vec3? max);
		public unowned Graphene.Box init_from_vectors ([CCode (array_length_cname = "n_vectors", array_length_pos = 0.5, array_length_type = "guint")] Graphene.Vec3[] vectors);
		public bool intersection (Graphene.Box b, out unowned Graphene.Box res);
		public static unowned Graphene.Box minus_one ();
		public static unowned Graphene.Box one ();
		public static unowned Graphene.Box one_minus_one ();
		public void union (Graphene.Box b, out unowned Graphene.Box res);
		public static unowned Graphene.Box zero ();
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_euler_t", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "graphene_euler_get_type ()")]
	[Compact]
	public class Euler {
		[CCode (cname = "graphene_euler_alloc", has_construct_function = false)]
		public Euler.alloc ();
		public bool equal (Graphene.Euler b);
		public void free ();
		public Graphene.EulerOrder get_order ();
		public float get_x ();
		public float get_y ();
		public float get_z ();
		public unowned Graphene.Euler init (float x, float y, float z);
		public unowned Graphene.Euler init_from_euler (Graphene.Euler? src);
		public unowned Graphene.Euler init_from_matrix (Graphene.Matrix? m, Graphene.EulerOrder order);
		public unowned Graphene.Euler init_from_quaternion (Graphene.Quaternion? q, Graphene.EulerOrder order);
		public unowned Graphene.Euler init_from_vec3 (Graphene.Vec3? v, Graphene.EulerOrder order);
		public unowned Graphene.Euler init_with_order (float x, float y, float z, Graphene.EulerOrder order);
		public void reorder (Graphene.EulerOrder order, out unowned Graphene.Euler res);
		public void to_matrix (out unowned Graphene.Matrix res);
		public void to_vec3 (out unowned Graphene.Vec3 res);
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_frustum_t", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "graphene_frustum_get_type ()")]
	[Compact]
	public class Frustum {
		[CCode (cname = "graphene_frustum_alloc", has_construct_function = false)]
		public Frustum.alloc ();
		public bool contains_point (Graphene.Point3D point);
		public void free ();
		public void get_planes ([CCode (array_length = false)] out unowned Graphene.Plane[] planes);
		public unowned Graphene.Frustum init (Graphene.Plane p0, Graphene.Plane p1, Graphene.Plane p2, Graphene.Plane p3, Graphene.Plane p4, Graphene.Plane p5);
		public unowned Graphene.Frustum init_from_frustum (Graphene.Frustum src);
		public unowned Graphene.Frustum init_from_matrix (Graphene.Matrix matrix);
		public bool intersects_box (Graphene.Box box);
		public bool intersects_sphere (Graphene.Sphere sphere);
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_matrix_t", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "graphene_matrix_get_type ()")]
	[Compact]
	public class Matrix {
		[CCode (cname = "graphene_matrix_alloc", has_construct_function = false)]
		public Matrix.alloc ();
		// Can't make this a constructor, valac won't let us chain constructors sideways
		public static Graphene.Matrix with_perspective(float fovy, float aspect, float z_near, float z_far) {
			var self = new Matrix.alloc();
			self.init_perspective(fovy, aspect, z_near, z_far);
			return self;
		}
		public static Graphene.Matrix with_look_at(Graphene.Vec3 eye, Graphene.Vec3 center, Graphene.Vec3 up) {
			var self = new Matrix.alloc();
			self.init_look_at(eye, center, up);
			return self;
		}
		public static Graphene.Matrix with_identity() {
			var self = new Matrix.alloc();
			self.init_identity();
			return self;
		}		
		public float determinant ();
		public void free ();
		public void get_row (uint index_, out unowned Graphene.Vec4 res);
		public float get_value (uint row, uint col);
		public float get_x_scale ();
		public float get_y_scale ();
		public float get_z_scale ();
		public unowned Graphene.Matrix init_from_2d (double xx, double yx, double xy, double yy, double x_0, double y_0);
		public unowned Graphene.Matrix init_from_float ([CCode (array_length = false)] float[] v);
		public unowned Graphene.Matrix init_from_matrix (Graphene.Matrix src);
		public unowned Graphene.Matrix init_from_vec4 (Graphene.Vec4 v0, Graphene.Vec4 v1, Graphene.Vec4 v2, Graphene.Vec4 v3);
		public unowned Graphene.Matrix init_frustum (float left, float right, float bottom, float top, float z_near, float z_far);
		public unowned Graphene.Matrix init_identity ();
		public unowned Graphene.Matrix init_look_at (Graphene.Vec3 eye, Graphene.Vec3 center, Graphene.Vec3 up);
		public unowned Graphene.Matrix init_ortho (float left, float right, float top, float bottom, float z_near, float z_far);
		public unowned Graphene.Matrix init_perspective (float fovy, float aspect, float z_near, float z_far);
		public unowned Graphene.Matrix init_rotate (float angle, Graphene.Vec3 axis);
		public unowned Graphene.Matrix init_scale (float x, float y, float z);
		public unowned Graphene.Matrix init_skew (float x_skew, float y_skew);
		public unowned Graphene.Matrix init_translate (Graphene.Point3D p);
		public void interpolate (Graphene.Matrix b, double factor, out unowned Graphene.Matrix res);
		public void inverse (out unowned Graphene.Matrix res);
		public bool is_2d ();
		public bool is_backface_visible ();
		public bool is_identity ();
		public bool is_singular ();
		public void multiply (Graphene.Matrix b, out unowned Graphene.Matrix res);
		public Graphene.Matrix chain_multi(Graphene.Matrix b) {
			Graphene.Matrix res = new Matrix.alloc();
			this.multiply(b, out res);
			return res;
		}
		public void normalize (out unowned Graphene.Matrix res);
		public void perspective (float depth, out unowned Graphene.Matrix res);
		public void print ();
		public void project_point (Graphene.Point p, out unowned Graphene.Point res);
		public void project_rect (Graphene.Rect r, out unowned Graphene.Quad res);
		public void project_rect_bounds (Graphene.Rect r, out unowned Graphene.Rect res);
		public void rotate (float angle, Graphene.Vec3 axis);
		public void rotate_euler (Graphene.Euler e);
		public void rotate_quaternion (Graphene.Quaternion q);
		public void rotate_x (float angle);
		public void rotate_y (float angle);
		public void rotate_z (float angle);
		public void scale (float factor_x, float factor_y, float factor_z);
		public void skew_xy (float factor);
		public void skew_xz (float factor);
		public void skew_yz (float factor);
		public bool to_2d (out double xx, out double yx, out double xy, out double yy, out double x_0, out double y_0);
		public void to_float ([CCode (array_length = false)] out unowned float[] v);
		public void transform_bounds (Graphene.Rect r, out unowned Graphene.Rect res);
		public void transform_box (Graphene.Box b, out unowned Graphene.Box res);
		public void transform_point (Graphene.Point p, out unowned Graphene.Point res);
		public void transform_point3d (Graphene.Point3D p, out unowned Graphene.Point3D res);
		public void transform_ray (Graphene.Ray r, out unowned Graphene.Ray res);
		public void transform_rect (Graphene.Rect r, out unowned Graphene.Quad res);
		public void transform_sphere (Graphene.Sphere s, out unowned Graphene.Sphere res);
		public void transform_vec3 (Graphene.Vec3 v, out unowned Graphene.Vec3 res);
		public void transform_vec4 (Graphene.Vec4 v, out unowned Graphene.Vec4 res);
		public void translate (Graphene.Point3D pos);
		public void transpose (out unowned Graphene.Matrix res);
		public void unproject_point3d (Graphene.Matrix modelview, Graphene.Point3D point, out unowned Graphene.Point3D res);
		public void untransform_bounds (Graphene.Rect r, Graphene.Rect bounds, out unowned Graphene.Rect res);
		public bool untransform_point (Graphene.Point p, Graphene.Rect bounds, out unowned Graphene.Point res);
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_plane_t", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "graphene_plane_get_type ()")]
	[Compact]
	public class Plane {
		[CCode (cname = "graphene_plane_alloc", has_construct_function = false)]
		public Plane.alloc ();
		public float distance (Graphene.Point3D point);
		public bool equal (Graphene.Plane p2);
		public void free ();
		public float get_constant ();
		public void get_normal (out unowned Graphene.Vec3 normal);
		public unowned Graphene.Plane init (Graphene.Vec3? normal, float constant);
		public unowned Graphene.Plane init_from_plane (Graphene.Plane src);
		public unowned Graphene.Plane init_from_point (Graphene.Vec3 normal, Graphene.Point3D point);
		public unowned Graphene.Plane init_from_points (Graphene.Point3D a, Graphene.Point3D b, Graphene.Point3D c);
		public unowned Graphene.Plane init_from_vec4 (Graphene.Vec4 src);
		public void negate (out unowned Graphene.Plane res);
		public void normalize (out unowned Graphene.Plane res);
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_point_t", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "graphene_point_get_type ()")]
	[Compact]
	public class Point {
		public float x;
		public float y;
		[CCode (cname = "graphene_point_alloc", has_construct_function = false)]
		public Point.alloc ();
		public float distance (Graphene.Point b, out float d_x, out float d_y);
		public bool equal (Graphene.Point b);
		public void free ();
		public unowned Graphene.Point init (float x, float y);
		public unowned Graphene.Point init_from_point (Graphene.Point src);
		public unowned Graphene.Point init_from_vec2 (Graphene.Vec2 src);
		public void interpolate (Graphene.Point b, double factor, out unowned Graphene.Point res);
		public bool near (Graphene.Point b, float epsilon);
		public void to_vec2 (out unowned Graphene.Vec2 v);
		public static unowned Graphene.Point zero ();
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_point3d_t", copy_function = "g_boxed_copy", free_function = "g_boxed_free", lower_case_csuffix = "point3d", type_id = "graphene_point3d_get_type ()")]
	[Compact]
	public class Point3D {
		public float x;
		public float y;
		public float z;
		[CCode (cname = "graphene_point3d_alloc", has_construct_function = false)]
		public Point3D.alloc ();
		public void cross (Graphene.Point3D b, out unowned Graphene.Point3D res);
		public float distance (Graphene.Point3D b, out unowned Graphene.Vec3 delta);
		public float dot (Graphene.Point3D b);
		public bool equal (Graphene.Point3D b);
		public void free ();
		public unowned Graphene.Point3D init (float x, float y, float z);
		public unowned Graphene.Point3D init_from_point (Graphene.Point3D src);
		public unowned Graphene.Point3D init_from_vec3 (Graphene.Vec3 v);
		public void interpolate (Graphene.Point3D b, double factor, out unowned Graphene.Point3D res);
		public float length ();
		public bool near (Graphene.Point3D b, float epsilon);
		public void normalize (out unowned Graphene.Point3D res);
		public void normalize_viewport (Graphene.Rect viewport, float z_near, float z_far, out unowned Graphene.Point3D res);
		public void scale (float factor, out unowned Graphene.Point3D res);
		public void to_vec3 (out unowned Graphene.Vec3 v);
		public static unowned Graphene.Point3D zero ();
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_quad_t", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "graphene_quad_get_type ()")]
	[Compact]
	public class Quad {
		[CCode (cname = "graphene_quad_alloc", has_construct_function = false)]
		public Quad.alloc ();
		public void bounds (out unowned Graphene.Rect r);
		public bool contains (Graphene.Point p);
		public void free ();
		public unowned Graphene.Point get_point (uint index_);
		public unowned Graphene.Quad init (Graphene.Point p1, Graphene.Point p2, Graphene.Point p3, Graphene.Point p4);
		public unowned Graphene.Quad init_from_points ([CCode (array_length = false)] Graphene.Point[] points);
		public unowned Graphene.Quad init_from_rect (Graphene.Rect r);
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_quaternion_t", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "graphene_quaternion_get_type ()")]
	[Compact]
	public class Quaternion {
		[CCode (cname = "graphene_quaternion_alloc", has_construct_function = false)]
		public Quaternion.alloc ();
		public float dot (Graphene.Quaternion b);
		public bool equal (Graphene.Quaternion b);
		public void free ();
		public unowned Graphene.Quaternion init (float x, float y, float z, float w);
		public unowned Graphene.Quaternion init_from_angle_vec3 (float angle, Graphene.Vec3 axis);
		public unowned Graphene.Quaternion init_from_angles (float deg_x, float deg_y, float deg_z);
		public unowned Graphene.Quaternion init_from_euler (Graphene.Euler e);
		public unowned Graphene.Quaternion init_from_matrix (Graphene.Matrix m);
		public unowned Graphene.Quaternion init_from_quaternion (Graphene.Quaternion src);
		public unowned Graphene.Quaternion init_from_vec4 (Graphene.Vec4 src);
		public unowned Graphene.Quaternion init_identity ();
		public void invert (out unowned Graphene.Quaternion res);
		public void normalize (out unowned Graphene.Quaternion res);
		public void slerp (Graphene.Quaternion b, float factor, out unowned Graphene.Quaternion res);
		public void to_angle_vec3 (out float angle, out unowned Graphene.Vec3 axis);
		public void to_angles (out float deg_x, out float deg_y, out float deg_z);
		public void to_matrix (out unowned Graphene.Matrix m);
		public void to_vec4 (out unowned Graphene.Vec4 res);
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_ray_t", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "graphene_ray_get_type ()")]
	[Compact]
	public class Ray {
		[CCode (cname = "graphene_ray_alloc", has_construct_function = false)]
		public Ray.alloc ();
		public bool equal (Graphene.Ray b);
		public void free ();
		public void get_closest_point_to_point (Graphene.Point3D p, out unowned Graphene.Point3D res);
		public void get_direction (out unowned Graphene.Vec3 direction);
		public float get_distance_to_plane (Graphene.Plane p);
		public float get_distance_to_point (Graphene.Point3D p);
		public void get_origin (out unowned Graphene.Point3D origin);
		public void get_position_at (float t, out unowned Graphene.Point3D position);
		public unowned Graphene.Ray init (Graphene.Point3D? origin, Graphene.Vec3? direction);
		public unowned Graphene.Ray init_from_ray (Graphene.Ray src);
		public unowned Graphene.Ray init_from_vec3 (Graphene.Vec3? origin, Graphene.Vec3? direction);
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_rect_t", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "graphene_rect_get_type ()")]
	[Compact]
	public class Rect {
		public weak Graphene.Point origin;
		public weak Graphene.Size size;
		public static Graphene.Rect alloc ();
		public bool contains_point (Graphene.Point p);
		public bool contains_rect (Graphene.Rect b);
		public bool equal (Graphene.Rect b);
		public void expand (Graphene.Point p, out unowned Graphene.Rect res);
		public void free ();
		public void get_bottom_left (out unowned Graphene.Point p);
		public void get_bottom_right (out unowned Graphene.Point p);
		public void get_center (out unowned Graphene.Point p);
		public float get_height ();
		public void get_top_left (out unowned Graphene.Point p);
		public void get_top_right (out unowned Graphene.Point p);
		public void get_vertices ([CCode (array_length = false)] out unowned Graphene.Vec2[] vertices);
		public float get_width ();
		public float get_x ();
		public float get_y ();
		public unowned Graphene.Rect init (float x, float y, float width, float height);
		public unowned Graphene.Rect init_from_rect (Graphene.Rect src);
		public unowned Graphene.Rect inset (float d_x, float d_y);
		public void inset_r (float d_x, float d_y, out unowned Graphene.Rect res);
		public void interpolate (Graphene.Rect b, double factor, out unowned Graphene.Rect res);
		public bool intersection (Graphene.Rect b, out unowned Graphene.Rect res);
		public unowned Graphene.Rect normalize ();
		public void normalize_r (out unowned Graphene.Rect res);
		public unowned Graphene.Rect offset (float d_x, float d_y);
		public void offset_r (float d_x, float d_y, out unowned Graphene.Rect res);
		public void round (out unowned Graphene.Rect res);
		[Version (deprecated = true, deprecated_since = "1.4")]
		public unowned Graphene.Rect round_to_pixel ();
		public void union (Graphene.Rect b, out unowned Graphene.Rect res);
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_size_t", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "graphene_size_get_type ()")]
	[Compact]
	public class Size {
		public float height;
		public float width;
		[CCode (cname = "graphene_size_alloc", has_construct_function = false)]
		public Size.alloc ();
		public bool equal (Graphene.Size b);
		public void free ();
		public unowned Graphene.Size init (float width, float height);
		public unowned Graphene.Size init_from_size (Graphene.Size src);
		public void interpolate (Graphene.Size b, double factor, out unowned Graphene.Size res);
		public void scale (float factor, out unowned Graphene.Size res);
		public static unowned Graphene.Size zero ();
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_sphere_t", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "graphene_sphere_get_type ()")]
	[Compact]
	public class Sphere {
		[CCode (cname = "graphene_sphere_alloc", has_construct_function = false)]
		public Sphere.alloc ();
		public bool contains_point (Graphene.Point3D point);
		public float distance (Graphene.Point3D point);
		public bool equal (Graphene.Sphere b);
		public void free ();
		public void get_bounding_box (out unowned Graphene.Box box);
		public void get_center (out unowned Graphene.Point3D center);
		public float get_radius ();
		public unowned Graphene.Sphere init (Graphene.Point3D? center, float radius);
		public unowned Graphene.Sphere init_from_points ([CCode (array_length_cname = "n_points", array_length_pos = 0.5, array_length_type = "guint")] Graphene.Point3D[] points, Graphene.Point3D? center);
		public unowned Graphene.Sphere init_from_vectors ([CCode (array_length_cname = "n_vectors", array_length_pos = 0.5, array_length_type = "guint")] Graphene.Vec3[] vectors, Graphene.Point3D? center);
		public bool is_empty ();
		public void translate (Graphene.Point3D point, out unowned Graphene.Sphere res);
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_triangle_t", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "graphene_triangle_get_type ()")]
	[Compact]
	public class Triangle {
		[CCode (cname = "graphene_triangle_alloc", has_construct_function = false)]
		public Triangle.alloc ();
		public bool contains_point (Graphene.Point3D p);
		public bool equal (Graphene.Triangle b);
		public void free ();
		public float get_area ();
		public bool get_barycoords (Graphene.Point3D? p, out unowned Graphene.Vec2 res);
		public void get_bounding_box (out unowned Graphene.Box res);
		public void get_midpoint (out unowned Graphene.Point3D res);
		public void get_normal (out unowned Graphene.Vec3 res);
		public void get_plane (out unowned Graphene.Plane res);
		public void get_points (out unowned Graphene.Point3D a, out unowned Graphene.Point3D b, out unowned Graphene.Point3D c);
		public void get_vertices (out unowned Graphene.Vec3 a, out unowned Graphene.Vec3 b, out unowned Graphene.Vec3 c);
		public unowned Graphene.Triangle init_from_point3d (Graphene.Point3D? a, Graphene.Point3D? b, Graphene.Point3D? c);
		public unowned Graphene.Triangle init_from_vec3 (Graphene.Vec3? a, Graphene.Vec3? b, Graphene.Vec3? c);
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_vec2_t", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "graphene_vec2_get_type ()")]
	[Compact]
	public class Vec2 {
		public void add (Graphene.Vec2 b, out unowned Graphene.Vec2 res);
		[CCode (cname = "graphene_vec2_alloc", has_construct_function = false)]
		public Vec2.alloc ();
		public void divide (Graphene.Vec2 b, out unowned Graphene.Vec2 res);
		public float dot (Graphene.Vec2 b);
		public bool equal (Graphene.Vec2 v2);
		public void free ();
		public float get_x ();
		public float get_y ();
		public unowned Graphene.Vec2 init (float x, float y);
		public unowned Graphene.Vec2 init_from_float ([CCode (array_length = false)] float[] src);
		public unowned Graphene.Vec2 init_from_vec2 (Graphene.Vec2 src);
		public float length ();
		public void max (Graphene.Vec2 b, out unowned Graphene.Vec2 res);
		public void min (Graphene.Vec2 b, out unowned Graphene.Vec2 res);
		public void multiply (Graphene.Vec2 b, out unowned Graphene.Vec2 res);
		public bool near (Graphene.Vec2 v2, float epsilon);
		public void negate (out unowned Graphene.Vec2 res);
		public void normalize (out unowned Graphene.Vec2 res);
		public static unowned Graphene.Vec2 one ();
		public void scale (float factor, out unowned Graphene.Vec2 res);
		public void subtract (Graphene.Vec2 b, out unowned Graphene.Vec2 res);
		public void to_float ([CCode (array_length = false)] out unowned float[] dest);
		public static unowned Graphene.Vec2 x_axis ();
		public static unowned Graphene.Vec2 y_axis ();
		public static unowned Graphene.Vec2 zero ();
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_vec3_t", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "graphene_vec3_get_type ()")]
	[Compact]
	public class Vec3 {
		public void add (Graphene.Vec3 b, out unowned Graphene.Vec3 res);
		[CCode (cname = "graphene_vec3_alloc", has_construct_function = false)]
		public Vec3.alloc ();
		public static Graphene.Vec3 with_coords(float x, float y, float z) {
			var self = new Vec3.alloc();
			self.init(x, y, z);
			return self;
		}
		public void cross (Graphene.Vec3 b, out unowned Graphene.Vec3 res);
		public void divide (Graphene.Vec3 b, out unowned Graphene.Vec3 res);
		public float dot (Graphene.Vec3 b);
		public bool equal (Graphene.Vec3 v2);
		public void free ();
		public float get_x ();
		public void get_xy (out unowned Graphene.Vec2 res);
		public void get_xy0 (out unowned Graphene.Vec3 res);
		public void get_xyz0 (out unowned Graphene.Vec4 res);
		public void get_xyz1 (out unowned Graphene.Vec4 res);
		public void get_xyzw (float w, out unowned Graphene.Vec4 res);
		public float get_y ();
		public float get_z ();
		public unowned Graphene.Vec3 init (float x, float y, float z);
		public unowned Graphene.Vec3 init_from_float ([CCode (array_length = false)] float[] src);
		public unowned Graphene.Vec3 init_from_vec3 (Graphene.Vec3 src);
		public float length ();
		public void max (Graphene.Vec3 b, out unowned Graphene.Vec3 res);
		public void min (Graphene.Vec3 b, out unowned Graphene.Vec3 res);
		public void multiply (Graphene.Vec3 b, out unowned Graphene.Vec3 res);
		public bool near (Graphene.Vec3 v2, float epsilon);
		public void negate (out unowned Graphene.Vec3 res);
		public void normalize (out unowned Graphene.Vec3 res);
		public static unowned Graphene.Vec3 one ();
		public void scale (float factor, out unowned Graphene.Vec3 res);
		public void subtract (Graphene.Vec3 b, out unowned Graphene.Vec3 res);
		public void to_float ([CCode (array_length = false)] out unowned float[] dest);
		public static unowned Graphene.Vec3 x_axis ();
		public static unowned Graphene.Vec3 y_axis ();
		public static unowned Graphene.Vec3 z_axis ();
		public static unowned Graphene.Vec3 zero ();
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_vec4_t", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "graphene_vec4_get_type ()")]
	[Compact]
	public class Vec4 {
		public void add (Graphene.Vec4 b, out unowned Graphene.Vec4 res);
		[CCode (cname = "graphene_vec4_alloc", has_construct_function = false)]
		public Vec4.alloc ();
		public void divide (Graphene.Vec4 b, out unowned Graphene.Vec4 res);
		public float dot (Graphene.Vec4 b);
		public bool equal (Graphene.Vec4 v2);
		public void free ();
		public float get_w ();
		public float get_x ();
		public void get_xy (out unowned Graphene.Vec2 res);
		public void get_xyz (out unowned Graphene.Vec3 res);
		public float get_y ();
		public float get_z ();
		public unowned Graphene.Vec4 init (float x, float y, float z, float w);
		public unowned Graphene.Vec4 init_from_float ([CCode (array_length = false)] float[] src);
		public unowned Graphene.Vec4 init_from_vec2 (Graphene.Vec2 src, float z, float w);
		public unowned Graphene.Vec4 init_from_vec3 (Graphene.Vec3 src, float w);
		public unowned Graphene.Vec4 init_from_vec4 (Graphene.Vec4 src);
		public float length ();
		public void max (Graphene.Vec4 b, out unowned Graphene.Vec4 res);
		public void min (Graphene.Vec4 b, out unowned Graphene.Vec4 res);
		public void multiply (Graphene.Vec4 b, out unowned Graphene.Vec4 res);
		public bool near (Graphene.Vec4 v2, float epsilon);
		public void negate (out unowned Graphene.Vec4 res);
		public void normalize (out unowned Graphene.Vec4 res);
		public static unowned Graphene.Vec4 one ();
		public void scale (float factor, out unowned Graphene.Vec4 res);
		public void subtract (Graphene.Vec4 b, out unowned Graphene.Vec4 res);
		public void to_float ([CCode (array_length = false)] out unowned float[] dest);
		public static unowned Graphene.Vec4 w_axis ();
		public static unowned Graphene.Vec4 x_axis ();
		public static unowned Graphene.Vec4 y_axis ();
		public static unowned Graphene.Vec4 z_axis ();
		public static unowned Graphene.Vec4 zero ();
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_euler_order_t", cprefix = "GRAPHENE_EULER_ORDER_", has_type_id = false)]
	public enum EulerOrder {
		DEFAULT,
		XYZ,
		YZX,
		ZXY,
		XZY,
		YXZ,
		ZYX
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "GRAPHENE_PI")]
	public const double PI;
	[CCode (cheader_filename = "graphene-gobject.h", cname = "GRAPHENE_PI_2")]
	public const double PI_2;
	[CCode (cheader_filename = "graphene-gobject.h", cname = "GRAPHENE_VEC2_LEN")]
	public const int VEC2_LEN;
	[CCode (cheader_filename = "graphene-gobject.h", cname = "GRAPHENE_VEC3_LEN")]
	public const int VEC3_LEN;
	[CCode (cheader_filename = "graphene-gobject.h", cname = "GRAPHENE_VEC4_LEN")]
	public const int VEC4_LEN;
}
