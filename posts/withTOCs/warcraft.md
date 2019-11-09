
Table of Contents
=================

   * [Auctionator](#auctionator)
      * [engineering spells (craftable items)](#engineering-spells-craftable-items)
      * [engineering reageants](#engineering-reageants)
   * [General macros](#general-macros)
      * [00 (sellGrey)](#00-sellgrey)
      * [01 (faction info)](#01-faction-info)
      * [02 (money)](#02-money)
      * [03](#03)
      * [04 (tank check)](#04-tank-check)
      * [05 (coords)](#05-coords)
      * [06 (camera)](#06-camera)
      * [07 - Camera zoom out](#07---camera-zoom-out)
      * [20 - Check for Timewalking quest completed](#20---check-for-timewalking-quest-completed)
      * [97 - Mouseover macro](#97---mouseover-macro)
      * [99 - Mount macro](#99---mount-macro)
   * [Warrior macros](#warrior-macros)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)



# Auctionator
## engineering spells (craftable items)
https://classic.wowhead.com/engineering-spells

## engineering reageants


# General macros
## 00 (sellGrey)
```
/run local c,i,n,v=0;for b=0,4 do for s=1,GetContainerNumSlots(b)do i={GetContainerItemInfo(b,s)}n=i[7]if n and string.find(n,"9d9d9d")then v={GetItemInfo(n)}q=i[2]c=c+v[11]*q;UseContainerItem(b,s)print(n,q)end;end;end;print(GetCoinText(c))
```

## 01 (faction info)
```
/run for i=1,GetNumFactions() do print(GetFactionInfo(i)) end
```

## 02 (money)
```
/script local cu = GetMoney(); print(GetCoinTextureString(cu,"12"))
/stopmacro [btn:1]
/script yy = GetNumWatchedTokens(); for xx = 1, yy,1 do aa, bb, cc, dd, ee = GetBackpackCurrencyInfo(xx); print(bb, aa) end
```

## 03

## 04 (tank check)
```
/run local b,d,p,r,a=GetBlockChance(),GetDodgeChance(),GetParryChance(),GetCombatRating(CR_DEFENSE_SKILL) a=1/(.0625+.956/(r/122.9625)) ChatFrame1:AddMessage(format("Unhittable: %.2f%%  Avoidance: %.2f%%  Defense %+.0f rating",b+d+p+5+a,d+p+5+a,r-689))
```

## 05 (coords)
```
/script SetMapToCurrentZone() local x,y=GetPlayerMapPosition("player") DEFAULT_CHAT_FRAME:AddMessage(format("%s, %s: %.1f, %.1f",GetZoneText(),GetSubZoneText(),x*100,y*100))
```

## 06 (camera)
```
/run print("CameraZoomIn(25)")
/console cameraDistanceMax 50
/run CameraZoomIn(25)
```

## 07 - Camera zoom out
```
/run print("CameraZoomOut(50))")
/console cameraDistanceMax 50
/run CameraZoomOut(50)
```

## 20 - Check for Timewalking quest completed
```
/script print(IsQuestFlaggedCompleted(40168))
/script print(IsQuestFlaggedCompleted(40173))
/script print(IsQuestFlaggedCompleted(40787))
/script print(IsQuestFlaggedCompleted(45563))
```

## 97 - Mouseover macro
```
#showtooltip
/use [@mouseover,help,nodead][help,nodead][@player] Spell Name
```

## 99 - Mount macro
```
#showtooltip
/use [noflyable, nomounted] Swift White Hawkstrider
/use [flyable, nomounted] Infinite Timereaver
/dismount [mounted]
```

# Warrior macros
chargeHamstring:
```
#showtooltip
/cast Charge
/cast Hamstring
```

intimidating bandage:
```
#showtooltip Intimidating Shout
/cast Intimidating Shout
/cast Heavy Runecloth Bandage
```

stance-specific spell casting:
```
#showtooltip
/cast [stance:1] Retaliation
/cast [stance:2] Shield Wall
/cast [stance:3] Recklessness
```

spell reflection:
```
/cast Defensive Stance
/equip MAIN_HAND
/equip SHIELD
/cast Spell Reflection
```

stance dance defensive:
```
#showtooltip
/equip MAIN_HAND
/equip SHIELD
/cast Defensive Stance
```

stance dance offensive:
```
/equip TWO_HAND
/cast Battle Stance
```

startattack:
```
#showtooltip
/cast Rend
/startattack
```

