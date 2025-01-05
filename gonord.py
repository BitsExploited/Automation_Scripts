# This is based on ImageGoNord lib by Schroedinger-Hat

from ImageGoNord import NordPaletteFile, GoNord
path = input("Enter the name of the image in Pictures: ")
go_nord = GoNord()
image = go_nord.open_image("Pictures/"+path)
go_nord.convert_image(image, save_path='Pictures/'+path)

