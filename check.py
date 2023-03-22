import math

def mod(sayi,m):
  return sayi % m


def IsTax(vkno):
  v1=mod((int(vkno[0])+9),10)
  v2=mod((int(vkno[1])+8),10)
  v3=mod((int(vkno[2])+7),10)
  v4=mod((int(vkno[3])+6),10)
  v5=mod((int(vkno[4])+5),10)
  v6=mod((int(vkno[5])+4),10)
  v7=mod((int(vkno[6])+3),10)
  v8=mod((int(vkno[7])+2),10)
  v9=mod((int(vkno[8])+1),10)
  vLast=int(vkno[9])
  
  v11=mod((v1*512),9)
  v21=mod((v2*256),9)
  v31=mod((v3*128),9)
  v41=mod((v4*64),9)
  v51=mod((v5*32),9)
  v61=mod((v6*16),9)
  v71=mod((v7*8),9)
  v81=mod((v8*4),9)
  v91=mod((v9*2),9)
   
  if v1!=0 and v11==0:v11=9
  if v2!=0 and v21==0:v21=9
  if v3!=0 and v31==0:v31=9
  if v4!=0 and v41==0:v41=9
  if v5!=0 and v51==0:v51=9
  if v6!=0 and v61==0:v61=9
  if v7!=0 and v71==0:v71=9
  if v8!=0 and v81==0:v81=9
  if v9!=0 and v91==0:v91=9
  
  toplam=v11+v21+v31+v41+v51+v61+v71+v81+v91
  
  
  if mod(toplam,10)==0: 
    toplam=0
  else:
    toplam=(10-mod(toplam,10))

  if toplam==vLast:
    return True
  else:
    return False
  
print(IsTax("8440013957"))  
