#include <iostream>

#include "vgl.h"
#include "LoadShaders.h"

using namespace std;

const int WINDOW_WIDTH = 500;
const int WINDOW_HEIGHT = 500;

GLuint    VAOs[1];
GLuint Buffers[1];

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
	glGenVertexArrays(1, VAOs);
	glBindVertexArray(VAOs[0]);

	GLfloat vertex_info[] = {
		-1.0f, -1.0f,         // first vertex position
		1.0f, 0.0f, 0.0f,  // first vertex color

		1.0f, -1.0f,         // second vertex position
		0.0f, 1.0f, 0.0f,  // second vertex color

		0.0f, 1.0f,         // third vertex position
		0.0f, 0.0f, 1.0f   // third vertex color
	};

	glGenBuffers(1, Buffers);
	glBindBuffer(GL_ARRAY_BUFFER, Buffers[0]);
	glBufferData(GL_ARRAY_BUFFER, sizeof(vertex_info), vertex_info, GL_STATIC_DRAW);

	compileShaders();

	glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, sizeof(GL_FLOAT) * 5, BUFFER_OFFSET(0));                     // position
	glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, sizeof(GL_FLOAT) * 5, BUFFER_OFFSET(sizeof(GL_FLOAT) * 2));  // color

	glEnableVertexAttribArray(0);
	glEnableVertexAttribArray(1);

	glClearColor(1, 1, 1, 1);
}

void display() {
	glClear(GL_COLOR_BUFFER_BIT);

	glBindVertexArray(VAOs[0]);
	glDrawArrays(GL_TRIANGLES, 0, 3);

	glFlush();
}

int main(int argc, char** argv) {
	glutInit(&argc, argv);

	glutInitDisplayMode(GLUT_RGBA);

	centerWindow();

	//glutInitContextVersion(3, 2);
	glutInitContextProfile(GLUT_CORE_PROFILE);

	glutCreateWindow("ColoredTriangle");

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