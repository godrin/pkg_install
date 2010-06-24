#include <ruby.h>
#include <SDL.h>

int main(int argc,char *argv[])
{
  ruby_init();
  ruby_options(argc,argv);
  ruby_run();
  return 0;
}