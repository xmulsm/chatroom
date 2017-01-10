import string
import random
def genInviteCode(length=6, chars= string.ascii_letters+string.digits):
    # while True:
    yield ''.join([random.choice(chars) for i in range(length)])
def coupon_gen():
    line1=list()
    for i in range(200):
        for item in genInviteCode():
            line1.append(item)
    line2=list(set(line1))
    return random.choice(line2)

print(coupon_gen())
