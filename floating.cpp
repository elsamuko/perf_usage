#include <iostream>

#define LOG( A ) std::cout << A << std::endl;

int main( int argc, char* argv[] ) {

    int ops = 1;
    
    if( argc == 2 ) {
        ops = std::atoi(argv[1]);
    }

    float a = 1.2;
    float b = 3.4;

    for( int i = 0; i < ops; ++i ) {
        LOG( a * b );
    }

    return 0;
}

