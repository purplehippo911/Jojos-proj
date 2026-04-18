#include <stdio.h>
#include <string.h>
#include <time.h>

#define MINIAUDIO_IMPLEMENTATION
#include "miniaudio.h"

int main(int argc, char *argv[]){
	srand(time(NULL));
	int choice = (argc >= 2) ? 0 : (rand() % 3 + 1);

	ma_result result;
	ma_engine engine;

	result = ma_engine_init(NULL, &engine);
	if (result != MA_SUCCESS) {
        	printf("Failed to initialize audio engine.\n");
		return -1;
	}


	if (argc >= 2) {
		if (strcmp(argv[1], "josu") == 0) choice = 1;
		if (strcmp(argv[1], "jol") == 0) choice = 2;
		if (strcmp(argv[1], "joseph") == 0) choice = 3;
	}

	const char *file = NULL;
	
	switch (choice) {
		case 1: file ="./assets/josuke.wav"; break;
		default:
			printf("Unknown argument.\n");
			ma_engine_uninit(&engine);
			return 1;
	}

	printf("Playing %s\n", file);

	result = ma_engine_play_sound(&engine, "./assets/josuke.wav", NULL);	
	if(result != MA_SUCCESS) {
		printf("Failed to play sound\n");
		ma_engine_uninit(&engine);
		return 1;
	}

	printf("Press Enter to quit..");
	getchar();

    ma_engine_uninit(&engine);
    return 0;
}

