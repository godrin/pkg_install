require 'rbconfig'
require 'ftools'

if Config::MAKEFILE_CONFIG["arch"]=~/.*darwin.*/
  Config::MAKEFILE_CONFIG["LIBARG"]='-framework %s'
#  File.copy()
end

require 'mkmf'

have_library('GL')
have_library('Cocoa')
have_library('OpenGL') # Mac
have_library('SDL')
have_library('SDL_image')
have_library('SDL_ttf')
have_library('SDL_mixer')

def find_sdl_header(libName)
  find_header(libName+'.h',['/Library/Frameworks/'+libName+'.framework/Headers'])
end
def find_gl_header(libName)
  find_header(libName+'.h',['/System/Library/Frameworks/OpenGL.framework/Headers'])
end

find_sdl_header('SDL')
find_sdl_header('SDL_image')
find_sdl_header('SDL_ttf')
find_sdl_header('SDL_mixer')

find_gl_header('GL')


create_makefile('Makefile')

makefile=File.open("Makefile"){|f|f.read}

makefile=makefile.sub(/^(all:.*)$/,'\1 rsdl')
["SDLMain","rubymain"].each{|f|
  makefile=makefile.sub(/^(OBJS.*)(#{f}\..)(.*)$/,'\1 \3')
  makefile=makefile.sub(/^(SRCS.*)(#{f}\..)(.*)$/,'\1 \3')
}
ld=makefile.split("\n").select{|l|l=~/^LDSHARED.*/}[0].sub("LDSHARED","LD").sub("-bundle","")
makefile+="\n"+ld
makefile+="\n.m.o:\n\t$(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) -c $<"
makefile+="\nrsdl: SDLMain.o rubymain.o Makefile
\t@-$(RM) $@
\t$(LD) -o $@ SDLMain.o rubymain.o $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)
"

File.open("Makefile","w"){|f|f.puts makefile}

##File.open("Makefile","a") {|f|
#  f.puts ".m.o:\n\t$(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) -c $<"
#}