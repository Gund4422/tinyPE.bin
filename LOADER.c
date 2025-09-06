#include <windows.h>
#include <stdio.h>

int main() {
    FILE *f = fopen("tinyPE.bin","rb");
    if (!f) return 1;

    fseek(f,0,SEEK_END);
    size_t sz = ftell(f);
    fseek(f,0,SEEK_SET);

    unsigned char *buf = (unsigned char*)VirtualAlloc(
        NULL, sz, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE
    );

    fread(buf, 1, sz, f);
    fclose(f);

    // Jump to the start of your raw PE
    void (*entry)() = (void(*)())buf;
    entry();

    return 0;
}
