



int main (void) {

	// init the debug screen functions
	pspDebugScreenInit();

	// creating the game object
	GameApp* game = new GameApp();
	// run the game app and get return value
	int ret = game->Run();


	return 0;
}




