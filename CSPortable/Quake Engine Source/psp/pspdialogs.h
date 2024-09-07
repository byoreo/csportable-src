/*
 *PSP DIALOGS LIBRARY
 *Thomas Klein			tommydanger@aon.at

 *This library will provide some
 *basic functions to call the
 *psp internal
 *  -messagebox
 *  -error
 *  -keyboard
 *dialogs as seen in psp games  
 */

#ifndef __PSP_DIALOGS_H__
#define __PSP_DIALGOS_H__

#include <pspkernel.h>
#include <string.h>
#include <psputility.h>
#include <pspgu.h>
#include <pspgum.h>

/*
  Autoset language according to your psp system
  see psputility_sysparam.h for language codes
*/
#define DIALOG_LANGUAGE_AUTO			(100)



/*
  Show a message dialog
  
  msg - Message to show
  language - set the language to display the message box in
  pass DIALOG_LANGUAGE_AUTO or see psputility_sysparam.h
*/
void pspShowMessageDialog(char *msg, u8 language);


/*
  Minimal rendering routine during dialog is active
*/
void minimalRender();


#endif

