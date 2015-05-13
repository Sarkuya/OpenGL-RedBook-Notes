#include <iostream>

#include "vgl.h"
#include "LoadShaders.h"

using namespace std;

const int WINDOW_WIDTH = 500;
const int WINDOW_HEIGHT = 500;

GLuint VAOs[1];    // vetex array objects
GLuint VBOs[1];    // vetex buffer objects
GLuint EBOs[1];    // element array buffer objects

void centerWindow() {
	glutInitWindowSize(WINDOW_WIDTH, WINDOW_HEIGHT);
	glutInitWindowPosition((glutGet(GLUT_SCREEN_WIDTH) - WINDOW_WIDTH) / 2, (glutGet(GLUT_SCREEN_HEIGHT) - WINDOW_HEIGHT) / 2);
}

void compileShaders() {
	ShaderInfo shaders[] = {
		{ GL_VERTEX_SHADER, "vs.glsl" },
		{ GL_FRAGMENT_SHADER, "fs.glsl" },
		{ GL_NONE, NULL }
	};

	GLuint program = LoadShaders(shaders);
	glUseProgram(program);
}

void init(void) {
	const GLfloat vertex_positions[] = {
		-1.0f, -1.0f,
		1.0f, -1.0f,
		1.0f, 1.0f,
		-1.0f, 1.0f
	};

	const GLfloat vertex_colors[] = {
		1.0f, 0.0f, 0.0f,
		0.0f, 1.0f, 0.0f,
		0.0f, 0.0f, 1.0f,
		1.0f, 1.0f, 0.0f
	};

	const GLushort vertex_indices[] = {
		0, 1, 2
	};

	// set up element array buffer
	glGenBuffers(1, EBOs);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBOs[0]);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(vertex_indices), vertex_indices, GL_STATIC_DRAW);

	// set up vetex array 
	glGenVertexArrays(1, VAOs);
	glBindVertexArray(VAOs[0]);

	// allocate spaces under current vertex array
	glGenBuffers(1, VBOs);
	glBindBuffer(GL_ARRAY_BUFFER, VBOs[0]);

	glBufferData(GL_ARRAY_BUFFER, sizeof(vertex_positions) + sizeof(vertex_colors), NULL, GL_STATIC_DRAW);
	glBufferSubData(GL_ARRAY_BUFFER, 0, sizeof(vertex_positions), vertex_positions);
	glBufferSubData(GL_ARRAY_BUFFER, sizeof(vertex_positions), sizeof(vertex_colors), vertex_colors);

	compileShaders();

	// tell OpenGL how to feed the variables in vetex shader with corresponding data from the VBO
	glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, 0, BUFFER_OFFSET(0));
	glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 0, BUFFER_OFFSET(sizeof(vertex_positions)));

	glEnableVertexAttribArray(0);
	glEnableVertexAttribArray(1);

	glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
	glClearColor(1, 1, 1, 1);
}

void display() {
	glClear(GL_COLOR_BUFFER_BIT);

	glBindVertexArray(VAOs[0]);

	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBOs[0]);

	glDrawElements(GL_TRIANGLES, 3, GL_UNSIGNED_SHORT, NULL);

	glFlush();
}

int main(int argc, char** argv) {
	glutInit(&argc, argv);

	glutInitDisplayMode(GLUT_RGBA);

	centerWindow();

	//glutInitContextVersion(3, 2);
	glutInitContextProfile(GLUT_CORE_PROFILE);

	glutCreateWindow("Drawing Commands");

	if (glewInit() != GLEW_OK) {
		cerr << "Unable to initialize GLEW ... exiting" << endl;
		exit(EXIT_FAILURE);
	}

	if (GLEW_VERSION_4_4) {
		cout << "Your graphics hardware supports OpenGL 4.4!" << endl;
	}
	else if (GLEW_VERSION_3_3) {
		cout << "Your graphics hardware supports OpenGL 3.3!" << endl;
	}

	init();

	glutDisplayFunc(display);
	glutMainLoop();
}