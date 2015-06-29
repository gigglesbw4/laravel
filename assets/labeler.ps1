#Labels Each Picture using Imagemagick
#http://www.imagemagick.org/script/binary-releases.php#windows

#Select which routine you would like to run: 1, 2, or 3 
$option=3

#Gravity is the position of the label: North, South, Center
$gravity="South" 

#Color of the background for the label: Green, Red, Orange, Purple, Blue, Black, White, Pink
#Use "convert -list color" to see more.
$backgroundcolor="White"

#Font related options, Use "convert -list font" to see more.
$font="Arial"
$size="50"
$fontcolor="Black"

switch ($option)
{
#Labels Each Picture in the file folder with it's name
1 {ls | foreach{ echo $_.name;convert.exe "$($_.name)"  -gravity $gravity `
-background $backgroundcolor -fill $fontcolor -font $font -splice 0x$size -pointsize $size -annotate +0+2 `
  "$($_.name.split(".")[0])"  "labaled-$($_.name.split(".")[0])$($_.extension)"  }}

#Write your own caption on each image with this version
2 {ls | foreach{ echo $_.name;$caption = Read-Host 'What caption would you like?';convert.exe "$($_.name)"  -gravity $gravity `
-background $backgroundcolor -fill $fontcolor -font $font -splice 0x$size -pointsize $size `
 -size 320x140 -annotate 0  $caption "labaled-$($_.name.split(".")[0])$($_.extension)"  }}
    
#Allows you to caption images individually
3 { $name = Read-Host 'Select an image you wish to caption'; echo $name; $caption = Read-Host 'What caption would you like?';convert.exe "$($name)"  -gravity $gravity `
-background $backgroundcolor -fill $fontcolor -font $font -splice 0x$size -pointsize $size `
 -annotate 0  $caption "labaled-$($name)"  }
  
}