def cyl_vol(radius,height):
    volume = 3.14 * (radius**2) * height
    return round(volume,1)

r = int(input(f"input the radius in cm: "))
h = int(input(f"input the height in cm: "))

v = cyl_vol(radius=r,height=h)
print(f"The volume of cylinder with radius: {r} cm and height: {h} cm is {v} cm2")