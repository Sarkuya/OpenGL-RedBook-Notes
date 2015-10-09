#include <iostream>

#include "vmath.h"

#include "vgl.h"
#include "LoadShaders.h"

using namespace std;

const int WINDOW_WIDTH = 500;
const int WINDOW_HEIGHT = 500;

GLuint VAOs[1];
GLuint VBOs[1];
GLuint EBOs[1];

void centerWindow() {
	glutInitWindowSize(WINDOW_WIDTH, WINDOW_HEIGHT);
	glutInitWindowPosition((glutGet(GLUT_SCREEN_WIDTH) - WINDOW_WIDTH) / 2, (glutGet(GLUT_SCREEN_HEIGHT) - WINDOW_HEIGHT) / 2);
}

void setupViewingMatrix(GLuint program) {
	GLint mViewingMatrix = glGetUniformLocation(program, "mViewingMatrix");

	vmath::mat4 viewMatrix = vmath::lookat(
		vmath::vec3(2.0f, 2.0f, 5.0f),
		vmath::vec3(-1.0f, -1.0f, -4.0f),
		vmath::vec3(0.0f, 1.0f, 0.0f)
	);

	vmath::mat4 projectMatrix = vmath::perspective(60.0, 1.0, 0.1, 1000.0);

	glUniformMatrix4fv(mViewingMatrix, 1, GL_FALSE, projectMatrix * viewMatrix);
}

void compileShaders() {
	ShaderInfo shaders[] = {
		{ GL_VERTEX_SHADER, "vs.glsl" },
		{ GL_FRAGMENT_SHADER, "fs.glsl" },
		{ GL_NONE, NULL }
	};

	GLuint program = LoadShaders(shaders);
	glUseProgram(program);

	setupViewingMatrix(program);
}

void init(void) {
	glGenVertexArrays(1, VAOs);
	glGenBuffers(1, VBOs);

	glBindVertexArray(VAOs[0]);
	glBindBuffer(GL_ARRAY_BUFFER, VBOs[0]);

	static const GLfloat vertices_position[] = {
		// defines like 'U'
		// first 4 vertices towards user
		-1.0f, -1.0f, -1.0f,    // 0
		-1.0f, -1.0f,  1.0f,    // 1
		-1.0f,  1.0f, -1.0f,    // 2
		-1.0f,  1.0f,  1.0f,    // 3
		 
		// last 4 vertices away from user
		 1.0f, -1.0f, -1.0f,    // 4
		 1.0f, -1.0f,  1.0f,    // 5
		 1.0f,  1.0f, -1.0f,    // 6
		 1.0f,  1.0f,  1.0f,    // 7
	};

	static const GLfloat vertices_color[] = {
		1.0f, 1.0f, 1.0f,
		1.0f, 1.0f, 0.0f,
		1.0f, 0.0f, 1.0f,
		1.0f, 0.0f, 0.0f,

		0.0f, 1.0f, 1.0f,
		0.0f, 1.0f, 0.0f,
		0.0f, 0.0f, 1.0f,
		0.5f, 0.5f, 0.5f
	};

	glBufferData(GL_ARRAY_BUFFER, sizeof(vertices_position) + sizeof(vertices_color), NULL, GL_STATIC_DRAW);
	glBufferSubData(GL_ARRAY_BUFFER, 0, sizeof(vertices_position), vertices_position);
	glBufferSubData(GL_ARRAY_BUFFER, sizeof(vertices_position), sizeof(vertices_color), vertices_color);

	glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, BUFFER_OFFSET(0));
	glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 0, BUFFER_OFFSET(sizeof(vertices_position)));

	glEnableVertexAttribArray(0);
	glEnableVertexAttribArray(1);

	// elements buffer object
	static const GLushort vertices_indices[] = {
		0, 1, 2, 3, 6, 7, 4, 5,
		0xFFFF,
		2, 6, 0, 4, 1, 5, 3, 7
	};
	glGenBuffers(1, EBOs);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBOs[0]);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(vertices_indices), vertices_indices, GL_STATIC_DRAW);

	compileShaders();

	glClearColor(0, 0, 0, 1);
}

void display() {
	glClear(GL_COLOR_BUFFER_BIT);

	glBindVertexArray(VAOs[0]);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBOs[0]);

	glDrawElements(GL_TRIANGLE_STRIP, 8, GL_UNSIGNED_SHORT, NULL);
	glDrawElements(GL_TRIANGLE_STRIP, 8, GL_UNSIGNED_SHORT, (const GLvoid *)(9 * sizeof(GLushort)));

	glFlush();
}

int main(int argc, char** argv) {
	glutInit(&argc, argv);

	glutInitDisplayMode(GLUT_RGBA);

	centerWindow();

	glutInitContextProfile(GLUT_CORE_PROFILE);

	glutCreateWindow("A 3D Box");

	if (glewInit() != GLEW_OK) {
		cerr << "Unable to initialize GLEW ... exiting" << endl;
		exit(EXIT_FAILURE);
	}

	init();

	glutDisplayFunc(display);
	glutMainLoop();
}