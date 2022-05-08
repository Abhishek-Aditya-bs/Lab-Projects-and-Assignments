; ModuleID = ""
target triple = "x86_64-apple-darwin21.4.0"
target datalayout = ""

define i32 @"main"() 
{
entry:
  %"a" = alloca i32
  store i32 6, i32* %"a"
  %"b" = alloca i32
  store i32 5, i32* %"b"
  %"c" = alloca i32
  store i32 0, i32* %"c"
  %".5" = load i32, i32* %"a"
  %".6" = load i32, i32* %"b"
  %".7" = add i32 %".5", %".6"
  store i32 %".7", i32* %"c"
  %".9" = load i32, i32* %"c"
  %"calltmp" = call i32 (i8*, ...) @"printf"(i8* getelementptr ([3 x i8], [3 x i8]* @"str", i32 0, i32 0), i32 %".9")
  ret i32 0
}

declare i32 @"printf"(i8* %".1", ...) 

@"str" = internal constant [3 x i8] c"%d\00"
