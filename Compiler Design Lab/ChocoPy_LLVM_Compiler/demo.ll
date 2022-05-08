; ModuleID = ""
target triple = "x86_64-apple-darwin21.4.0"
target datalayout = ""

define i32 @"main"() 
{
entry:
  %"x" = alloca i32
  store i32 1, i32* %"x"
  %"y" = alloca i32
  store i32 2, i32* %"y"
  %"a" = alloca i1
  store i1 1, i1* %"a"
  %"b" = alloca i1
  store i1 0, i1* %"b"
  %"c" = alloca i8*
  store i8* getelementptr ([1 x i8], [1 x i8]* @"str", i32 0, i32 0), i8** %"c"
  %"d" = alloca i8*
  store i8* getelementptr ([1 x i8], [1 x i8]* @"str.1", i32 0, i32 0), i8** %"d"
  %".8" = load i1, i1* %"a"
  store i1 %".8", i1* %"b"
  %".10" = load i32, i32* %"x"
  %".11" = load i32, i32* %"y"
  %".12" = icmp ne i32 %".10", %".11"
  %"calltmp" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([3 x i8], [3 x i8]* @"str.2", i32 0, i32 0), i1 %".12")
  %".13" = load i32, i32* %"y"
  store i32 %".13", i32* %"x"
  %".15" = load i32, i32* %"x"
  %".16" = load i32, i32* %"y"
  %".17" = icmp eq i32 %".15", %".16"
  %"calltmp.1" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([3 x i8], [3 x i8]* @"str.3", i32 0, i32 0), i1 %".17")
  store i32 2, i32* %"x"
  store i32 2, i32* %"y"
  %".20" = load i32, i32* %"x"
  %".21" = load i32, i32* %"y"
  %".22" = icmp eq i32 %".20", %".21"
  %"calltmp.2" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([3 x i8], [3 x i8]* @"str.4", i32 0, i32 0), i1 %".22")
  store i32 0, i32* %"x"
  %".24" = load i32, i32* %"x"
  %".25" = icmp eq i32 %".24", 0
  %"calltmp.3" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([3 x i8], [3 x i8]* @"str.5", i32 0, i32 0), i1 %".25")
  %".26" = load i32, i32* %"y"
  %".27" = icmp eq i32 %".26", 0
  %"calltmp.4" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([3 x i8], [3 x i8]* @"str.6", i32 0, i32 0), i1 %".27")
  %".28" = load i1, i1* %"a"
  %".29" = load i1, i1* %"b"
  %".30" = icmp eq i1 %".28", %".29"
  %"calltmp.5" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([3 x i8], [3 x i8]* @"str.7", i32 0, i32 0), i1 %".30")
  store i1 0, i1* %"b"
  %".32" = load i1, i1* %"a"
  %".33" = load i1, i1* %"b"
  %".34" = icmp ne i1 %".32", %".33"
  %"calltmp.6" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([3 x i8], [3 x i8]* @"str.8", i32 0, i32 0), i1 %".34")
  %".35" = load i8*, i8** %"c"
  %"calltmp.7" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([3 x i8], [3 x i8]* @"str.9", i32 0, i32 0), i8* %".35")
  %".36" = load i8*, i8** %"d"
  %"calltmp.8" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([3 x i8], [3 x i8]* @"str.10", i32 0, i32 0), i8* %".36")
  store i8* getelementptr ([4 x i8], [4 x i8]* @"str.11", i32 0, i32 0), i8** %"d"
  %".38" = load i8*, i8** %"c"
  %"calltmp.9" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([3 x i8], [3 x i8]* @"str.12", i32 0, i32 0), i8* %".38")
  %".39" = load i8*, i8** %"d"
  %"calltmp.10" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([3 x i8], [3 x i8]* @"str.13", i32 0, i32 0), i8* %".39")
  store i8* getelementptr ([4 x i8], [4 x i8]* @"str.14", i32 0, i32 0), i8** %"d"
  %".41" = load i8*, i8** %"c"
  %"calltmp.11" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([3 x i8], [3 x i8]* @"str.15", i32 0, i32 0), i8* %".41")
  %".42" = load i8*, i8** %"d"
  %"calltmp.12" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([3 x i8], [3 x i8]* @"str.16", i32 0, i32 0), i8* %".42")
  store i8* getelementptr ([4 x i8], [4 x i8]* @"str.17", i32 0, i32 0), i8** %"d"
  %".44" = load i8*, i8** %"c"
  %"calltmp.13" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([3 x i8], [3 x i8]* @"str.18", i32 0, i32 0), i8* %".44")
  %".45" = load i8*, i8** %"d"
  %"calltmp.14" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([4 x i8], [4 x i8]* @"str.19", i32 0, i32 0), i8* %".45")
  ret i32 0
}

declare i32 @"printf"(i8* %".1", ...) 

@"str" = internal constant [1 x i8] c"\00"
@"str.1" = internal constant [1 x i8] c"\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"
@"str.6" = internal constant [3 x i8] c"%d\00"
@"str.7" = internal constant [3 x i8] c"%d\00"
@"str.8" = internal constant [3 x i8] c"%d\00"
@"str.9" = internal constant [3 x i8] c"%s\00"
@"str.10" = internal constant [3 x i8] c"%s\00"
@"str.11" = internal constant [4 x i8] c"123\00"
@"str.12" = internal constant [3 x i8] c"%s\00"
@"str.13" = internal constant [3 x i8] c"%s\00"
@"str.14" = internal constant [4 x i8] c"456\00"
@"str.15" = internal constant [3 x i8] c"%s\00"
@"str.16" = internal constant [3 x i8] c"%s\00"
@"str.17" = internal constant [4 x i8] c"123\00"
@"str.18" = internal constant [3 x i8] c"%s\00"
@"str.19" = internal constant [4 x i8] c"%s\0a\00"
