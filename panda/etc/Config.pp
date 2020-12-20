//
// Config.pp
//
// This file configures the build system for a wintools environment on all
// platforms.
//

// This matters to $OTP and $TTMODELS.
#define LANGUAGE english

// Compile with optimize 3 for the development build.  This compiles
// release-optimized code, but includes debug symbols, asserts, PStats, and
// memory tracking, which are useful for development.
#define OPTIMIZE 3

// These are the environment variables that Panda will evaluate to get a list
// PRC directories to search along.
#define PRC_PATH_ENVVARS CFG_PATH ETC_PATH

// These are the filename patterns that will be searched for to load PRC files.
#define PRC_PATTERNS *.prc Configrc

// Now include the platform-specific Config.pp file if it exists.
#sinclude Config.$[PLATFORM].pp
