#version 430 core

in vec4 fs_color;

layout (location = 0) out vec4 color;

void main() {
	color = fs_color;
	//color = vec4(1.0f, 0.0f, 0.0f, 1.0f);
}