// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.



.assembly extern mscorlib { }
.assembly extern System.Console
{
  .publickeytoken = (B0 3F 5F 7F 11 D5 0A 3A )
  .ver 4:0:0:0
}
.assembly 'refloc_u2'// as "refloc_u2"
{

  //  .custom instance void ['mscorlib']System.Diagnostics.DebuggableAttribute::.ctor(bool,
  //                                                                                  bool) = ( 01 00 00 01 00 00 ) 
  
  
}
.assembly extern xunit.core {}
// MVID: {ADBCF0C8-A2B9-4481-BF63-32F2CB11E46E}
.namespace Test
{
  .class private auto ansi AA extends ['mscorlib']System.Object
  {
    .field static family class Test.AA s_aa
    .field family class Test.AA m_aa
    .field public unsigned int16 mm
    .field public static bool finalizerCalled
    .method family hidebysig virtual instance void
            Finalize() il managed
    {
      // Code size       61 (0x3d)
      .maxstack  8
      IL_0000:  ldstr      "finalizer called."
      IL_0005:  call       void [System.Console]System.Console::WriteLine(class System.String)
      IL_000a:  ldarg.0
      IL_0028:  ldfld      unsigned int16 Test.AA::mm
      IL_002d:  conv.i4
      			ldc.i4.s   45
      IL_002e:  beq.s      IL_0036

      IL_0030:  newobj     instance void ['mscorlib']System.Exception::.ctor()
      IL_0035:  throw

      IL_0036:  ldc.i4.1
      IL_0037:  stsfld     bool Test.AA::finalizerCalled
      IL_003c:  ret
    } // end of method 'AA::Finalize'

    .method public hidebysig specialname rtspecialname static 
            void .cctor() il managed
    {
      // Code size       17 (0x11)
      .maxstack  8
      IL_0000:  newobj     instance void Test.AA::.ctor()
      IL_0005:  stsfld     class Test.AA Test.AA::s_aa
      IL_000a:  ldc.i4.0
      IL_000b:  stsfld     bool Test.AA::finalizerCalled
      IL_0010:  ret
    } // end of method 'AA::.cctor'

    .method public hidebysig specialname rtspecialname 
            instance void .ctor() il managed
    {
      // Code size       26 (0x1a)
      .maxstack  8
      IL_0000:  ldarg.0
      IL_0001:  ldsfld     class Test.AA Test.AA::s_aa
      IL_0006:  stfld      class Test.AA Test.AA::m_aa
      IL_000b:  ldarg.0
      IL_000c:  ldc.i4.s   45
      IL_000e:  stfld      unsigned int16 Test.AA::mm
      IL_0013:  ldarg.0
      IL_0014:  call       instance void ['mscorlib']System.Object::.ctor()
      IL_0019:  ret
    } // end of method 'AA::.ctor'

  } // end of class 'AA'

  .class private auto ansi App extends ['mscorlib']System.Object
  {
    .field private static class Test.AA s_aa
    .method private hidebysig static void
            Litter() il managed
    {
      // Code size       43 (0x2b)
      .maxstack  2
      .locals (int32 V_0,
               int32[] V_1)
      IL_0000:  call       void ['mscorlib']System.GC::Collect()
      IL_0005:  ldc.i4.0
      IL_0006:  stloc.0
      IL_0007:  br.s       IL_0018

      IL_0009:  ldc.i4     0x3e8
      IL_000e:  newarr     ['mscorlib']System.Int32
      IL_0013:  stloc.1
      IL_0014:  ldloc.0
      IL_0015:  ldc.i4.1
      IL_0016:  add
      IL_0017:  stloc.0
      IL_0018:  ldloc.0
      IL_0019:  ldc.i4     0x3e8
      IL_001e:  blt.s      IL_0009

      IL_0020:  call       void ['mscorlib']System.GC::Collect()
      IL_0025:  call       void ['mscorlib']System.GC::WaitForPendingFinalizers()
      IL_002a:  ret
    } // end of method 'App::Litter'

    .method private hidebysig static int32
            Main() il managed
    {
      .custom instance void [xunit.core]Xunit.FactAttribute::.ctor() = (
          01 00 00 00
      )
      .entrypoint
      // Code size       65 (0x41)
      .maxstack  2
      .locals (unsigned int16 & V_0,
               int32 V_1)
      IL_0000:  ldsfld     class Test.AA Test.App::s_aa
      IL_0005:  ldflda      unsigned int16 Test.AA::mm
      IL_000a:  stloc.0
      IL_000b:  ldnull
      IL_000c:  stsfld     class Test.AA Test.App::s_aa
      IL_0011:  call       void Test.App::Litter()
      IL_0016:  ldsfld     bool Test.AA::finalizerCalled
      IL_001b:  brtrue.s   IL_0023

      IL_001d:  ldloc.0
      			ldind.i2
      IL_001e:  conv.i4
      IL_001f:  ldc.i4.s   45
      IL_0021:  beq.s      IL_0031

      IL_0023:  ldstr      "*** failed ***"
      IL_0028:  call       void [System.Console]System.Console::WriteLine(class System.String)
      IL_002d:  ldc.i4.1
      IL_002e:  stloc.1
      IL_002f:  br.s       IL_003f

      IL_0031:  ldstr      "*** passed ***"
      IL_0036:  call       void [System.Console]System.Console::WriteLine(class System.String)
      IL_003b:  ldc.i4    0x64
      IL_003c:  stloc.1
      IL_003d:  br.s       IL_003f

      IL_003f:  ldloc.1
      IL_0040:  ret
    } // end of method 'App::Main'

    .method public hidebysig specialname rtspecialname static 
            void .cctor() il managed
    {
      // Code size       11 (0xb)
      .maxstack  8
      IL_0000:  newobj     instance void Test.AA::.ctor()
      IL_0005:  stsfld     class Test.AA Test.App::s_aa
      IL_000a:  ret
    } // end of method 'App::.cctor'

    .method public hidebysig specialname rtspecialname 
            instance void .ctor() il managed
    {
      // Code size       7 (0x7)
      .maxstack  8
      IL_0000:  ldarg.0
      IL_0001:  call       instance void ['mscorlib']System.Object::.ctor()
      IL_0006:  ret
    } // end of method 'App::.ctor'

  } // end of class 'App'

} // end of namespace 'Test'

//*********** DISASSEMBLY COMPLETE ***********************
