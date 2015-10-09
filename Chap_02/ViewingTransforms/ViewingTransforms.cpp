#include <iostream>

#include "vmath.h"

#include "vgl.h"
#include "LoadShaders.h"

using namespace std;

const int WINDOW_WIDTH = 500;
const int WINDOW_HEIGHT = 500;

GLuint VAOs[1];
GLuint VBOs[1];

void centerWindow() {
	glutInitWindowSize(WINDOW_WIDTH, WINDOW_HEIGHT);
	glutInitWindowPosition((glutGet(GLUT_SCREEN_WIDTH) - WINDOW_WIDTH) / 2, (glutGet(GLUT_SCREEN_HEIGHT) - WINDOW_HEIGHT) / 2);
}

void setupViewingMatrix(GLuint program) {
	GLint mViewingMatrix = glGetUniformLocation(program, "mViewingMatrix");

	vmath::mat4 rotateMatrix = vmath::rotate(90.0f, 0.0f, 0.0f, 1.0f);
	vmath::mat4 translateMatrix = vmath::translate(0.3f, 0.0f, 0.0f);
	vmath::mat4 scaleMatrix = vmath::scale(0.7f);
	vmath::mat4 modelMatrix = translateMatrix * rotateMatrix * scaleMatrix;

	vmath::mat4 viewMatrix = vmath::lookat(
		vmath::vec3(0.0f, 0.0f, 5.0f),
		vmath::vec3(0.0f, 0.0f, -100.0f),
		vmath::vec3(0.0f, 1.0f, 0.0f)
		);

	vmath::mat4 projectMatrix = vmath::perspective(60.0, 1.3, 1.0, 100.0);

	glUniformMatrix4fv(mViewingMatrix, 1, GL_FALSE, projectMatrix * modelMatrix * viewMatrix);
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

	GLfloat triangle[] = {
		-0.5f, -0.5f,
		1.0f, 0.0f, 0.0f,
		0.5f, -0.5f,
		0.0f, 1.0f, 0.0f,
		0.0f, 0.5f,
		0.0f, 0.0f, 1.0f
	};
	glBufferData(GL_ARRAY_BUFFER, sizeof(triangle), triangle, GL_STATIC_DRAW);
	glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, sizeof(GL_FLOAT) * 5, BUFFER_OFFSET(0));
	glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, sizeof(GL_FLOAT) * 5, BUFFER_OFFSET(sizeof(GL_FLOAT) * 2));
	glEnableVertexAttribArray(0);
	glEnableVertexAttribArray(1);

	compileShaders();

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

	glutInitContextProfile(GLUT_CORE_PROFILE);

	glutCreateWindow("Viewing Transformations");

	if (glewInit() != GLEW_OK) {
		cerr << "Unable to initialize GLEW ... exiting" << endl;
		exit(EXIT_FAILURE);
	}

	init();

	glutDisplayFunc(display);
	glutMainLoop();
}