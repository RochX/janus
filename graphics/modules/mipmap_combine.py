import math, os
from pathlib import Path
from PIL import Image, ImageDraw

# clamp pixel value
def clamp(n, smallest=0, largest=255): return max(smallest, min(n, largest))

# angle in rads
def dist_from_line(P, angle, point):
  Px, Py = P
  x0, y0 = point
  dist = abs(math.cos(angle)*(Py - y0) - math.sin(angle)*(Px - x0))
  return dist


def append_images_vertically(image1_path, image2_path, output_path):
    # Open the images
    img1 = Image.open(image1_path)
    img2 = Image.open(image2_path)

    # Must be same width
    assert (img1.width == img2.width)

    # Calculate dimensions for the new image
    new_width = img1.width
    new_height = img1.height + img2.height

    # Create a new blank image and paste both images into it
    new_image = Image.new("RGBA", (new_width, new_height))
    new_image.paste(img1, (0, 0))
    new_image.paste(img2, (0, img1.height))

    # Save the combined image
    new_image.save(output_path)
    print(f"Appended image saved to {output_path}")

def split_image_by_line(image1_path, image2_path, output_path, point, angle, base_size, num_mips=4):
    # Open images
    img1 = Image.open(image1_path)
    img2 = Image.open(image2_path)

    # must be same size
    assert(img1.size == img2.size)

    width, height = img1.size

    # Convert angle to radians
    angle_rad = math.radians(angle)

    # Create mask
    mask = Image.new("L", (width, height), 0)
    draw = ImageDraw.Draw(mask)

    offset = 0
    for i in range(0,num_mips):
      scale = 1/(2**i)

      x0, y0 = point
      scaled_point = (x0*scale + offset, y0*scale)
      x0, y0 = scaled_point

      m = math.tan(angle_rad)
      b = y0 - m * x0
      # Fill mask based on which side of the line each pixel lies
      for t in range(int(base_size*scale)):
        # offset x
        x = t+offset
        for y in range(height):
          # gradient = max(base_size*0.05,1)
          gradient = 4
          side_of_line = gradient if y > m * x + b else -gradient
          
          dist = dist_from_line(scaled_point,angle_rad,(x,y))
          pixel = clamp(round(128+dist*side_of_line))
          mask.putpixel((x,y),pixel)

          # optional code to mark the line
          # if y == m * x + b or dist <= 0:
          #   mask.putpixel((x,y), 255)
      
      offset += int(base_size*scale)

    # Combine images using the mask
    mask.save("testing/mask.png")
    combined = Image.composite(img1, img2, mask)
    combined.save(output_path)

    print(f"Image split along line through {point} at {angle}° saved to {output_path}")


# split_image_by_line("testing/quality-module-1-tech.png", "testing/speed-module-1-tech.png", "testing/test-tech.png", point=(128,160), angle=50, base_size=256)
# split_image_by_line("testing/quality-module.png", "testing/speed-module.png", "testing/test.png", point=(32,28), angle=50, base_size=64)


def sample_icon_splits():
  set_angle = 80
  first_img = True
  for point in [(32,y) for y in range(16, 32+1,2)]:
    if first_img:
      split_image_by_line("testing/quality-module-3.png", "testing/speed-module-3.png", "testing/out.png", point=point, angle=set_angle, base_size=64)
      first_img = False
    else:
      split_image_by_line("testing/quality-module-3.png", "testing/speed-module-3.png", "testing/temp.png", point=point, angle=set_angle, base_size=64)
      append_images_vertically("testing/out.png", "testing/temp.png", "testing/out.png")

  # these are best options for module icons
  split_image_by_line("testing/quality-module-3.png", "testing/speed-module-3.png", "testing/final.png", point=(32,22), angle=45, base_size=64)
  split_image_by_line("testing/quality-module-3.png", "testing/speed-module-3.png", "testing/final2.png", point=(32,20), angle=80, base_size=64)

def sample_tech_splits():
  set_angle = 80
  first_img = True
  for point in [(128,y) for y in range(96, 200,8)]:
    if first_img:
      split_image_by_line("testing/quality-module-1-tech.png", "testing/speed-module-1-tech.png", "testing/out.png", point=point, angle=set_angle, base_size=256)
      first_img = False
    else:
      split_image_by_line("testing/quality-module-1-tech.png", "testing/speed-module-1-tech.png", "testing/temp.png", point=point, angle=set_angle, base_size=256)
      append_images_vertically("testing/out.png", "testing/temp.png", "testing/out.png")

  # best for tech icons
  split_image_by_line("testing/quality-module-1-tech.png", "testing/productivity-module-1-tech.png", "testing/final-tech.png", point=(128,144), angle=80, base_size=256)


os.makedirs("final", exist_ok=True)
for p1 in Path("working_files").iterdir():
  for p2 in Path("working_files").iterdir():
    str1 = str(p1)
    str2 = str(p2)

    if str1[-10:] == str2[-10:] and str1 != str2:
      point = (128,144) if "tech" in p1.name else (32,20)
      angle = 80
      base_size = 256 if "tech" in p1.name else 64
      mod1 = p1.name.split("-")[0]
      mod2 = p2.name.split("-")[0]
      lvl = p1.name.split("-")[2][0]

      str_lst = [mod1,mod2,"module",lvl]
      if "tech" in p1.name:
        str_lst.append("tech")

      
      output_path = "final/" + "-".join(str_lst) + ".png"
      split_image_by_line(p1,p2,output_path, point, angle, base_size)
