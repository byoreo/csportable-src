#include "pspdialogs.h"

/* pspdlg list */
unsigned int __attribute__((aligned(16))) mylist[262144];


void pspShowMessageDialog(char *message, u8 language)
{
    pspUtilityMsgDialogParams dialog;
    SceSize dialog_size = sizeof(dialog);

    memset(&dialog, 0, dialog_size);

    dialog.base.size = dialog_size;
    
    if(language == DIALOG_LANGUAGE_AUTO)
 		sceUtilityGetSystemParamInt(PSP_SYSTEMPARAM_ID_INT_LANGUAGE,&dialog.base.language);
    else
		dialog.base.language = language;

    sceUtilityGetSystemParamInt(PSP_SYSTEMPARAM_ID_INT_UNKNOWN, &dialog.base.buttonSwap);

    dialog.base.graphicsThread = 0x11;
    dialog.base.accessThread = 0x13;
    dialog.base.fontThread = 0x12;
    dialog.base.soundThread = 0x10;


   dialog.mode = PSP_UTILITY_MSGDIALOG_MODE_TEXT;

    strcpy(dialog.message, message);

    sceUtilityMsgDialogInitStart(&dialog);


    for(;;) 
    {
		minimalRender();

		switch(sceUtilityMsgDialogGetStatus()) 
		{

			case 2:
				sceUtilityMsgDialogUpdate(2);
				break;
	    
			case 3:
				sceUtilityMsgDialogShutdownStart();
				break;
	    
			case 0:
			return;
	    
		}
		sceDisplayWaitVblankStart();	
		sceGuSwapBuffers();
	}
}


void minimalRender()
{
      sceGuStart(GU_DIRECT,mylist);
      sceGuClearColor(0xff000000);
      sceGuClearDepth(0);
      sceGuClear(GU_COLOR_BUFFER_BIT|GU_DEPTH_BUFFER_BIT);
      sceGuFinish();
      sceGuSync(0,0);
}


