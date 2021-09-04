#!/usr/bin/env python3

#
# This script copies the DLLs built by wintools into the built/bin folder.
# This is needed because the build process puts all the DLLS in the folders of
# their respective packages, but the attach tool sets up the environment to
# search in wintools/built/bin for the DLLs.
#

import os
import glob
import shutil

all_dlls = glob.glob("built/**/*.dll", recursive=True)

copy_dlls = []
for dll in all_dlls:
    # Don't copy DLLs already in the built/bin folder.
    if "built/bin" not in dll and "built\\bin" not in dll:
        copy_dlls.append(dll)

out = "built/bin/%s"
for dll in copy_dlls:
    basename = os.path.basename(dll)
    print("Copying", dll, "to", out % basename)
    shutil.copy(dll, out % basename)
