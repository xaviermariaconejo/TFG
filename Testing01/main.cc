#include <iostream>
#include <bobcat/readlinestream>

#include "Scanner.h"

using namespace std;
using namespace FBB;

int main() {
    ReadLineStream rls("? ");           // create the ReadLineStream, using "? "
                                        // as a prompt before each line

    Scanner scanner(rls);               // pass 'rls' to the interactive scanner

                                        // process all the line's tokens
                                        // (the prompt is provided by 'rls')
    while (int token = scanner.lex())
    {
        if (token == '\n')              // end of line: new prompt
            continue;

        cout << scanner.matched() << endl;
        if (scanner.matched()[0] == 'q')
            return 0;
    }
}