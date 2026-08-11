

// kk_ssize_t len = kk_string_len(prompt, ctx);
// const char * cstring = kk_string_cbuf_borrow(prompt, &len);
// char * input = linenoise(cstring);
// kk_string_t kk_input = kk_string_alloc_raw(input, true, ctx);
// return kk_input;

// --outputdir=dir       write intermediate files in <dir>, defaults to:
//                       <builddir>/<ver>-<buildtag>/<cc>-<variant>-<hash>
// --libdir=dir          object library <dir> (= <prefix>/lib/koka/<ver>)
// --sharedir=dir        source library <dir> (= <prefix>/share/koka/<ver>)
// --cc=cmd              use <cmd> as the C backend compiler
// --ccincdir[=dirs]     search semi-colon separated <dirs> for headers
// --cclibdir[=dirs]     search semi-colon separated <dirs> for libraries
// --cclib=libs          link with semi-colon separated system <libs>
// --ccopts[=opts]       pass <opts> to C backend compiler
// --cclinkopts[=opts]   pass <opts> to C backend linker

// ❯ pkg-config --libs raylib
// -L/nix/store/435j8fcfhr13nlbzinkrbz9q5lkxj08i-raylib-6.0/lib -lraylib
// ❯ pkg-config --cflags raylib
// -I/nix/store/435j8fcfhr13nlbzinkrbz9q5lkxj08i-raylib-6.0/include


// koka raylib.kk -e --ccincdir /nix/store/435j8fcfhr13nlbzinkrbz9q5lkxj08i-raylib-6.0/include


