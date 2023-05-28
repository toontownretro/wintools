//
// Config.Win32.pp
//
// This file configures the build system for a wintools environment on a
// Windows platform.
//

////////////////////////////////////////////////////////////////////////////////////
// The following variables are derived from the environment variables that
// come from env.bat.  Don't edit this directly.  Instead, edit the variables
// in env.bat that these variables derive themselves from.

#define PYTHON_IPATH $[unixshortname $[PYTHON_LOCATION]\include]
#define PYTHON_LPATH $[unixshortname $[PYTHON_LOCATION]\libs]
#define PYTHON_LIBS python3.lib
#define PYPY_LIBS python38.lib

// We're using PyPy, So we want to properly setup for it.
#if $[and $[libtest $[PYTHON_LPATH],$[PYPY_LIBS]],$[not $[libtest $[PYTHON_LPATH],$[PYTHON_LIBS]]]]
#define PYTHON_LIBS $[PYPY_LIBS]
#define PYTHON_COMMAND pypy
#endif

// Comment this out to compile with DirectX 9 support.  You need to have the
// DirectX SDK installed (August 2009 or newer).
#define HAVE_DX9
#define DX9_IPATH $[unixshortname $[DX_SDK_LOCATION]\Include]
#define DX9_LPATH $[unixshortname $[DX_SDK_LOCATION]\Lib\$[if $[WIN64_PLATFORM],x64,x86]]

#define MAYA_LOCATION $[unixshortname $[MAYA_LOCATION]]

////////////////////////////////////////////////////////////////////////////////////

// The following paths you should not have to mess with, they are set up to
// use the packages built by $WINTOOLS.

#define BULLET_IPATH $[WINTOOLS]/built/bullet/include
#define BULLET_LPATH $[WINTOOLS]/built/bullet/lib

#define EMBREE_IPATH $[WINTOOLS]/built/embree/include
#define EMBREE_LPATH $[WINTOOLS]/built/embree/lib

#define OIDN_IPATH $[WINTOOLS]/built/oidn/include
#define OIDN_LPATH $[WINTOOLS]/built/oidn/lib

#define FREETYPE_IPATH $[WINTOOLS]/built/freetype/include/freetype2
#define FREETYPE_LPATH $[WINTOOLS]/built/freetype/lib

#define VALVE_STEAMNET_IPATH $[WINTOOLS]/built/gamenetworkingsockets/include/GameNetworkingSockets
#define VALVE_STEAMNET_LPATH $[WINTOOLS]/built/gamenetworkingsockets/lib

#define GLSLANG_IPATH $[WINTOOLS]/built/glslang/include
#define GLSLANG_LPATH $[WINTOOLS]/built/glslang/lib

#define HARFBUZZ_IPATH $[WINTOOLS]/built/harfbuzz/include
#define HARFBUZZ_LPATH $[WINTOOLS]/built/harfbuzz/lib

#define JPEG_IPATH $[WINTOOLS]/built/jpeg/include
#define JPEG_LPATH $[WINTOOLS]/built/jpeg/lib

#define ODE_IPATH $[WINTOOLS]/built/ode/include
#define ODE_LPATH $[WINTOOLS]/built/ode/lib

#define OPENAL_IPATH $[WINTOOLS]/built/openal/include
#define OPENAL_LPATH $[WINTOOLS]/built/openal/lib

#define OPENSSL_IPATH $[WINTOOLS]/built/openssl/include
#define OPENSSL_LPATH $[WINTOOLS]/built/openssl/lib

#define PNG_IPATH $[WINTOOLS]/built/png/include
#define PNG_LPATH $[WINTOOLS]/built/png/lib

#define SPIRV_CROSS_IPATH $[WINTOOLS]/built/spirv-cross/include
#define SPIRV_CROSS_LPATH $[WINTOOLS]/built/spirv-cross/lib

#define SPIRV_TOOLS_IPATH $[WINTOOLS]/built/spirv-tools/include
#define SPIRV_TOOLS_LPATH $[WINTOOLS]/built/spirv-tools/lib

#define SQUISH_IPATH $[WINTOOLS]/built/squish/include
#define SQUISH_LPATH $[WINTOOLS]/built/squish/lib

#define TIFF_IPATH $[WINTOOLS]/built/tiff/include
#define TIFF_LPATH $[WINTOOLS]/built/tiff/lib

#define VORBIS_IPATH $[WINTOOLS]/built/vorbis/include
#define VORBIS_LPATH $[WINTOOLS]/built/vorbis/lib

#define ZLIB_IPATH $[WINTOOLS]/built/zlib/include
#define ZLIB_LPATH $[WINTOOLS]/built/zlib/lib

#define EIGEN_IPATH $[WINTOOLS]/built/eigen/include

#define MIMALLOC_IPATH $[WINTOOLS]/built/mimalloc/include
#define MIMALLOC_LPATH $[WINTOOLS]/built/mimalloc/lib

#define FMOD_IPATH $[WINTOOLS]/built/fmod/include
#define FMOD_LPATH $[WINTOOLS]/built/fmod/lib

#define PHYSX_IPATH $[WINTOOLS]/built/physx/include
#define PHYSX_LPATH $[WINTOOLS]/built/physx/lib

#define STEAM_AUDIO_IPATH $[WINTOOLS]/built/steamaudio/include
#define STEAM_AUDIO_LPATH $[WINTOOLS]/built/steamaudio/lib
