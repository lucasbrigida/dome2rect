@ECHO OFF
@title latlong2rect v1.3 - immersive transformations

echo latlong2rect v1.3 - May 6, 2015
echo script by Andrew Hazelden
echo ----------------------------------------------------------------------
echo latlong2rect converts a latitude/longitude image sequence into rectilinear
echo format using the moving panorama program by Helmut Dersch and FFMPEG.
echo ----------------------------------------------------------------------
echo Check out the PTStitcher wiki for the script syntax:
echo http://wiki.panotools.org/PTStitcher

rem Note: mpremap accepts piped .pnm image streams

REM All image sequences start on frame number 0 (eg. 0.jpg)

REM Use the exact image name for a single frame (eg. image.0009.jpg)
REM Use %%d.jpg for an unpadded image sequence (eg:  9.jpg)
REM Use %%.4d.jpg for a padded image sequence (eg: 0009.jpg)

REM Process a single frame for testing:
@set ptscript=latlong2rect
@set input=input\latlong.jpg
@set output=output\sequence.%%d.jpg

REM Process a 4 digit padded image sequence:
REM @set ptscript=latlong2rect
REM @set input=input\zosma.%%.4d.jpg
REM @set output=output\sequence.%%d.jpg

REM Move to the base dome2rect folder
cd C:\dome2rect\

REM Run the remapping program
bin\mpremap.exe -f scripts\%ptscript% -o %output% %input%

REM echo Loading frames into viewer...
PAUSE
REM C:\dome2rect\review.bat %output%
