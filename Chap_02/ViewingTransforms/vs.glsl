#version 430 core

uniform mat4 mViewingMatrix;

layout (location = 0) in vec4 vPosition;
layout (location = 1) in vec4 vColor;

out vec4 fsColor;

void main() {
	gl_Position = mViewingMatrix * vPosition;

	fsColor = vColor;
}