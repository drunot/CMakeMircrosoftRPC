/* file hellop.c */
#include <stdio.h>
#include <windows.h>
#include "hello.h"

void HelloProc(char* pszString) {
    printf("%s\n", pszString);
}

void Shutdown(void) {
    RPC_STATUS status;
    status = RpcMgmtStopServerListening(NULL);

    if(status) {
        exit(status);
    }

    status = RpcServerUnregisterIf(NULL, NULL, FALSE);

    if(status) {
        exit(status);
    }
} //end Shutdown
