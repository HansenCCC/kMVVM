
starttime=$(date +%Y-%m-%d\ %H:%M:%S)
echo "🚀 开始时间 $starttime 🚀"
echo `pwd`

#export kSourceDir="~/Library/Developer/Xcode/Templates/Source/"
#export kTemplateUbanDir="~/Library/Developer/Xcode/Templates/Source/JiangXi\ Uban\ MVVM.xctemplate"

rm -rf dir ~/Library/Developer/Xcode/Templates/Source/
mkdir -p ~/Library/Developer/Xcode/Templates/Source/

cp -R YPTools.xctemplate  ~/Library/Developer/Xcode/Templates/Source/YPTools.xctemplate
cp -R YPTools-Category.xctemplate  ~/Library/Developer/Xcode/Templates/Source/YPTools-Category.xctemplate
cp -R YPTools-TC.xctemplate  ~/Library/Developer/Xcode/Templates/Source/YPTools-TC.xctemplate

echo "🚀 结束时间 $endtime 🚀"
