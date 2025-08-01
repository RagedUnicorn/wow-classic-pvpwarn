--[[
  MIT License

  Copyright (c) 2025 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
]]--

local mod = rgpvpw
local me = {}
mod.testCombatEventsSelfAvoidPriest = me

me.tag = "TestCombatEventsSelfAvoidPriest"

local testCategory = "priest"

function me.Test()
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testselfavoidcombatevent priest")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueDodge_19280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueBlock_19280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueParry_19280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueMiss_19280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueResist_19280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueImmune_19280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueReflect_19280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_19280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueDodge_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueBlock_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueParry_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueMiss_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueResist_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueImmune_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueReflect_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueDodge_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueBlock_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueParry_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueMiss_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueResist_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueImmune_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueReflect_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueDodge_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueBlock_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueParry_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueMiss_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueResist_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueImmune_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueReflect_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueDodge_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueParry_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueImmune_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueMiss_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueBlock_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueResist_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueReflect_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueDodge_19279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueParry_19279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueImmune_19279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueMiss_19279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueBlock_19279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueResist_19279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueReflect_19279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_19279)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutDodge_15326)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutParry_15326)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutImmune_15326)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutMiss_15326)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutBlock_15326)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutResist_15326)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutReflect_15326)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutAbsorbIgnored_15326)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutDodge_15268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutParry_15268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutImmune_15268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutMiss_15268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutBlock_15268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutResist_15268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutReflect_15268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutAbsorbIgnored_15268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutDodge_15323)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutParry_15323)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutImmune_15323)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutMiss_15323)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutBlock_15323)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutResist_15323)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutReflect_15323)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutAbsorbIgnored_15323)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutDodge_15324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutParry_15324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutImmune_15324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutMiss_15324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutBlock_15324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutResist_15324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutReflect_15324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutAbsorbIgnored_15324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutDodge_15325)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutParry_15325)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutImmune_15325)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutMiss_15325)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutBlock_15325)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutResist_15325)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutReflect_15325)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutAbsorbIgnored_15325)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnDodge_10876)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnParry_10876)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnImmune_10876)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnMiss_10876)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnBlock_10876)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnResist_10876)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnReflect_10876)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnAbsorbIgnored_10876)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnDodge_8129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnParry_8129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnImmune_8129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnMiss_8129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnBlock_8129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnResist_8129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnReflect_8129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnAbsorbIgnored_8129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnDodge_8131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnParry_8131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnImmune_8131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnMiss_8131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnBlock_8131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnResist_8131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnReflect_8131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnAbsorbIgnored_8131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnDodge_10874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnParry_10874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnImmune_10874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnMiss_10874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnBlock_10874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnResist_10874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnReflect_10874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnAbsorbIgnored_10874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnDodge_10875)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnParry_10875)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnImmune_10875)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnMiss_10875)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnBlock_10875)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnResist_10875)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnReflect_10875)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnAbsorbIgnored_10875)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlDodge_10912)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlParry_10912)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlImmune_10912)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlMiss_10912)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlBlock_10912)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlResist_10912)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlReflect_10912)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlAbsorbIgnored_10912)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlDodge_605)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlParry_605)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlImmune_605)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlMiss_605)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlBlock_605)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlResist_605)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlReflect_605)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlAbsorbIgnored_605)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlDodge_10911)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlParry_10911)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlImmune_10911)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlMiss_10911)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlBlock_10911)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlResist_10911)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlReflect_10911)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlAbsorbIgnored_10911)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamDodge_10890)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamParry_10890)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamImmune_10890)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamMiss_10890)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamBlock_10890)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamResist_10890)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamReflect_10890)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamAbsorbIgnored_10890)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamDodge_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamParry_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamImmune_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamMiss_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamBlock_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamResist_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamReflect_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamAbsorbIgnored_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamDodge_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamParry_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamImmune_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamMiss_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamBlock_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamResist_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamReflect_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamAbsorbIgnored_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamDodge_10888)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamParry_10888)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamImmune_10888)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamMiss_10888)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamBlock_10888)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamResist_10888)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamReflect_10888)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamAbsorbIgnored_10888)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainDodge_10894)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainParry_10894)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainImmune_10894)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainMiss_10894)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainBlock_10894)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainResist_10894)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainReflect_10894)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_10894)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainDodge_589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainParry_589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainImmune_589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainMiss_589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainBlock_589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainResist_589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainReflect_589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainDodge_594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainParry_594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainImmune_594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainMiss_594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainBlock_594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainResist_594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainReflect_594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainDodge_970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainParry_970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainImmune_970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainMiss_970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainBlock_970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainResist_970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainReflect_970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainDodge_992)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainParry_992)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainImmune_992)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainMiss_992)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainBlock_992)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainResist_992)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainReflect_992)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_992)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainDodge_2767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainParry_2767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainImmune_2767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainMiss_2767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainBlock_2767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainResist_2767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainReflect_2767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_2767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainDodge_10892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainParry_10892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainImmune_10892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainMiss_10892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainBlock_10892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainResist_10892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainReflect_10892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_10892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainDodge_10893)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainParry_10893)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainImmune_10893)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainMiss_10893)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainBlock_10893)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainResist_10893)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainReflect_10893)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_10893)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSilenceDodge_15487)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSilenceParry_15487)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSilenceImmune_15487)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSilenceMiss_15487)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSilenceBlock_15487)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSilenceResist_15487)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSilenceReflect_15487)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSilenceAbsorbIgnored_15487)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidVampiricEmbraceDodge_15286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidVampiricEmbraceParry_15286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidVampiricEmbraceImmune_15286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidVampiricEmbraceMiss_15286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidVampiricEmbraceBlock_15286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidVampiricEmbraceResist_15286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidVampiricEmbraceReflect_15286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidVampiricEmbraceAbsorbIgnored_15286)
end

function me.TestCombatEventSelfAvoidDevouringPlagueDodge_19280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueDodge_19280",
    testCategory,
    19280,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueBlock_19280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueBlock_19280",
    testCategory,
    19280,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueParry_19280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueParry_19280",
    testCategory,
    19280,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueMiss_19280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueMiss_19280",
    testCategory,
    19280,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueResist_19280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueResist_19280",
    testCategory,
    19280,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueImmune_19280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueImmune_19280",
    testCategory,
    19280,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueReflect_19280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueReflect_19280",
    testCategory,
    19280,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_19280()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_19280",
    testCategory,
    19280,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueDodge_2944()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueDodge_2944",
    testCategory,
    2944,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueBlock_2944()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueBlock_2944",
    testCategory,
    2944,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueParry_2944()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueParry_2944",
    testCategory,
    2944,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueMiss_2944()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueMiss_2944",
    testCategory,
    2944,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueResist_2944()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueResist_2944",
    testCategory,
    2944,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueImmune_2944()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueImmune_2944",
    testCategory,
    2944,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueReflect_2944()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueReflect_2944",
    testCategory,
    2944,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_2944()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_2944",
    testCategory,
    2944,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueDodge_19276()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueDodge_19276",
    testCategory,
    19276,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueBlock_19276()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueBlock_19276",
    testCategory,
    19276,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueParry_19276()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueParry_19276",
    testCategory,
    19276,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueMiss_19276()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueMiss_19276",
    testCategory,
    19276,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueResist_19276()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueResist_19276",
    testCategory,
    19276,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueImmune_19276()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueImmune_19276",
    testCategory,
    19276,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueReflect_19276()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueReflect_19276",
    testCategory,
    19276,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_19276()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_19276",
    testCategory,
    19276,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueDodge_19277()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueDodge_19277",
    testCategory,
    19277,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueBlock_19277()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueBlock_19277",
    testCategory,
    19277,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueParry_19277()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueParry_19277",
    testCategory,
    19277,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueMiss_19277()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueMiss_19277",
    testCategory,
    19277,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueResist_19277()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueResist_19277",
    testCategory,
    19277,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueImmune_19277()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueImmune_19277",
    testCategory,
    19277,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueReflect_19277()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueReflect_19277",
    testCategory,
    19277,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_19277()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_19277",
    testCategory,
    19277,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueDodge_19278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueDodge_19278",
    testCategory,
    19278,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueParry_19278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueParry_19278",
    testCategory,
    19278,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueImmune_19278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueImmune_19278",
    testCategory,
    19278,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueMiss_19278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueMiss_19278",
    testCategory,
    19278,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueBlock_19278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueBlock_19278",
    testCategory,
    19278,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueResist_19278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueResist_19278",
    testCategory,
    19278,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueReflect_19278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueReflect_19278",
    testCategory,
    19278,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_19278()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_19278",
    testCategory,
    19278,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueDodge_19279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueDodge_19279",
    testCategory,
    19279,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueParry_19279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueParry_19279",
    testCategory,
    19279,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueImmune_19279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueImmune_19279",
    testCategory,
    19279,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueMiss_19279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueMiss_19279",
    testCategory,
    19279,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueBlock_19279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueBlock_19279",
    testCategory,
    19279,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueResist_19279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueResist_19279",
    testCategory,
    19279,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueReflect_19279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueReflect_19279",
    testCategory,
    19279,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_19279()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_19279",
    testCategory,
    19279,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidBlackoutDodge_15326()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutDodge_15326",
    testCategory,
    15326,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidBlackoutParry_15326()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutParry_15326",
    testCategory,
    15326,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidBlackoutImmune_15326()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutImmune_15326",
    testCategory,
    15326,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidBlackoutMiss_15326()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutMiss_15326",
    testCategory,
    15326,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidBlackoutBlock_15326()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutBlock_15326",
    testCategory,
    15326,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidBlackoutResist_15326()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutResist_15326",
    testCategory,
    15326,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidBlackoutReflect_15326()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutReflect_15326",
    testCategory,
    15326,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidBlackoutAbsorbIgnored_15326()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidBlackoutAbsorbIgnored_15326",
    testCategory,
    15326,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidBlackoutDodge_15268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutDodge_15268",
    testCategory,
    15268,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidBlackoutParry_15268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutParry_15268",
    testCategory,
    15268,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidBlackoutImmune_15268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutImmune_15268",
    testCategory,
    15268,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidBlackoutMiss_15268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutMiss_15268",
    testCategory,
    15268,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidBlackoutBlock_15268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutBlock_15268",
    testCategory,
    15268,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidBlackoutResist_15268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutResist_15268",
    testCategory,
    15268,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidBlackoutReflect_15268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutReflect_15268",
    testCategory,
    15268,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidBlackoutAbsorbIgnored_15268()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidBlackoutAbsorbIgnored_15268",
    testCategory,
    15268,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidBlackoutDodge_15323()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutDodge_15323",
    testCategory,
    15323,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidBlackoutParry_15323()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutParry_15323",
    testCategory,
    15323,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidBlackoutImmune_15323()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutImmune_15323",
    testCategory,
    15323,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidBlackoutMiss_15323()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutMiss_15323",
    testCategory,
    15323,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidBlackoutBlock_15323()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutBlock_15323",
    testCategory,
    15323,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidBlackoutResist_15323()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutResist_15323",
    testCategory,
    15323,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidBlackoutReflect_15323()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutReflect_15323",
    testCategory,
    15323,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidBlackoutAbsorbIgnored_15323()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidBlackoutAbsorbIgnored_15323",
    testCategory,
    15323,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidBlackoutDodge_15324()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutDodge_15324",
    testCategory,
    15324,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidBlackoutParry_15324()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutParry_15324",
    testCategory,
    15324,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidBlackoutImmune_15324()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutImmune_15324",
    testCategory,
    15324,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidBlackoutMiss_15324()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutMiss_15324",
    testCategory,
    15324,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidBlackoutBlock_15324()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutBlock_15324",
    testCategory,
    15324,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidBlackoutResist_15324()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutResist_15324",
    testCategory,
    15324,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidBlackoutReflect_15324()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutReflect_15324",
    testCategory,
    15324,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidBlackoutAbsorbIgnored_15324()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidBlackoutAbsorbIgnored_15324",
    testCategory,
    15324,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidBlackoutDodge_15325()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutDodge_15325",
    testCategory,
    15325,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidBlackoutParry_15325()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutParry_15325",
    testCategory,
    15325,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidBlackoutImmune_15325()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutImmune_15325",
    testCategory,
    15325,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidBlackoutMiss_15325()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutMiss_15325",
    testCategory,
    15325,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidBlackoutBlock_15325()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutBlock_15325",
    testCategory,
    15325,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidBlackoutResist_15325()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutResist_15325",
    testCategory,
    15325,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidBlackoutReflect_15325()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutReflect_15325",
    testCategory,
    15325,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidBlackoutAbsorbIgnored_15325()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidBlackoutAbsorbIgnored_15325",
    testCategory,
    15325,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidManaBurnDodge_10876()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnDodge_10876",
    testCategory,
    10876,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidManaBurnParry_10876()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnParry_10876",
    testCategory,
    10876,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidManaBurnImmune_10876()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnImmune_10876",
    testCategory,
    10876,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidManaBurnMiss_10876()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnMiss_10876",
    testCategory,
    10876,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidManaBurnBlock_10876()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnBlock_10876",
    testCategory,
    10876,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidManaBurnResist_10876()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnResist_10876",
    testCategory,
    10876,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidManaBurnReflect_10876()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnReflect_10876",
    testCategory,
    10876,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidManaBurnAbsorbIgnored_10876()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidManaBurnAbsorbIgnored_10876",
    testCategory,
    10876,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidManaBurnDodge_8129()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnDodge_8129",
    testCategory,
    8129,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidManaBurnParry_8129()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnParry_8129",
    testCategory,
    8129,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidManaBurnImmune_8129()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnImmune_8129",
    testCategory,
    8129,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidManaBurnMiss_8129()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnMiss_8129",
    testCategory,
    8129,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidManaBurnBlock_8129()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnBlock_8129",
    testCategory,
    8129,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidManaBurnResist_8129()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnResist_8129",
    testCategory,
    8129,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidManaBurnReflect_8129()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnReflect_8129",
    testCategory,
    8129,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidManaBurnAbsorbIgnored_8129()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidManaBurnAbsorbIgnored_8129",
    testCategory,
    8129,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidManaBurnDodge_8131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnDodge_8131",
    testCategory,
    8131,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidManaBurnParry_8131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnParry_8131",
    testCategory,
    8131,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidManaBurnImmune_8131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnImmune_8131",
    testCategory,
    8131,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidManaBurnMiss_8131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnMiss_8131",
    testCategory,
    8131,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidManaBurnBlock_8131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnBlock_8131",
    testCategory,
    8131,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidManaBurnResist_8131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnResist_8131",
    testCategory,
    8131,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidManaBurnReflect_8131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnReflect_8131",
    testCategory,
    8131,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidManaBurnAbsorbIgnored_8131()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidManaBurnAbsorbIgnored_8131",
    testCategory,
    8131,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidManaBurnDodge_10874()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnDodge_10874",
    testCategory,
    10874,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidManaBurnParry_10874()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnParry_10874",
    testCategory,
    10874,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidManaBurnImmune_10874()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnImmune_10874",
    testCategory,
    10874,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidManaBurnMiss_10874()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnMiss_10874",
    testCategory,
    10874,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidManaBurnBlock_10874()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnBlock_10874",
    testCategory,
    10874,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidManaBurnResist_10874()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnResist_10874",
    testCategory,
    10874,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidManaBurnReflect_10874()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnReflect_10874",
    testCategory,
    10874,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidManaBurnAbsorbIgnored_10874()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidManaBurnAbsorbIgnored_10874",
    testCategory,
    10874,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidManaBurnDodge_10875()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnDodge_10875",
    testCategory,
    10875,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidManaBurnParry_10875()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnParry_10875",
    testCategory,
    10875,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidManaBurnImmune_10875()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnImmune_10875",
    testCategory,
    10875,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidManaBurnMiss_10875()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnMiss_10875",
    testCategory,
    10875,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidManaBurnBlock_10875()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnBlock_10875",
    testCategory,
    10875,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidManaBurnResist_10875()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnResist_10875",
    testCategory,
    10875,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidManaBurnReflect_10875()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnReflect_10875",
    testCategory,
    10875,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidManaBurnAbsorbIgnored_10875()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidManaBurnAbsorbIgnored_10875",
    testCategory,
    10875,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidMindControlDodge_10912()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlDodge_10912",
    testCategory,
    10912,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidMindControlParry_10912()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlParry_10912",
    testCategory,
    10912,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidMindControlImmune_10912()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlImmune_10912",
    testCategory,
    10912,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidMindControlMiss_10912()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlMiss_10912",
    testCategory,
    10912,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidMindControlBlock_10912()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlBlock_10912",
    testCategory,
    10912,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidMindControlResist_10912()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlResist_10912",
    testCategory,
    10912,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidMindControlReflect_10912()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlReflect_10912",
    testCategory,
    10912,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidMindControlAbsorbIgnored_10912()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidMindControlAbsorbIgnored_10912",
    testCategory,
    10912,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidMindControlDodge_605()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlDodge_605",
    testCategory,
    605,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidMindControlParry_605()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlParry_605",
    testCategory,
    605,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidMindControlImmune_605()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlImmune_605",
    testCategory,
    605,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidMindControlMiss_605()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlMiss_605",
    testCategory,
    605,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidMindControlBlock_605()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlBlock_605",
    testCategory,
    605,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidMindControlResist_605()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlResist_10912",
    testCategory,
    605,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidMindControlReflect_605()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlReflect_605",
    testCategory,
    605,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidMindControlAbsorbIgnored_605()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidMindControlAbsorbIgnored_605",
    testCategory,
    605,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidMindControlDodge_10911()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlDodge_10911",
    testCategory,
    10911,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidMindControlParry_10911()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlParry_10911",
    testCategory,
    10911,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidMindControlImmune_10911()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlImmune_10911",
    testCategory,
    10911,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidMindControlMiss_10911()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlMiss_10911",
    testCategory,
    10911,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidMindControlBlock_10911()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlBlock_10911",
    testCategory,
    10911,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidMindControlResist_10911()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlResist_10912",
    testCategory,
    10911,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidMindControlReflect_10911()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlReflect_10911",
    testCategory,
    10911,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidMindControlAbsorbIgnored_10911()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidMindControlAbsorbIgnored_10911",
    testCategory,
    10911,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end


function me.TestCombatEventSelfAvoidPsychicScreamDodge_10890()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamDodge_10890",
    testCategory,
    10890,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamParry_10890()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamParry_10890",
    testCategory,
    10890,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamImmune_10890()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamImmune_10890",
    testCategory,
    10890,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamMiss_10890()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamMiss_10890",
    testCategory,
    10890,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamBlock_10890()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamBlock_10890",
    testCategory,
    10890,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamResist_10890()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamResist_10890",
    testCategory,
    10890,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamReflect_10890()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamReflect_10890",
    testCategory,
    10890,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamAbsorbIgnored_10890()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidPsychicScreamAbsorbIgnored_10890",
    testCategory,
    10890,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end


function me.TestCombatEventSelfAvoidPsychicScreamDodge_8122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamDodge_8122",
    testCategory,
    8122,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamParry_8122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamParry_8122",
    testCategory,
    8122,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamImmune_8122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamImmune_8122",
    testCategory,
    8122,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamMiss_8122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamMiss_8122",
    testCategory,
    8122,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamBlock_8122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamBlock_8122",
    testCategory,
    8122,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamResist_8122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamResist_8122",
    testCategory,
    8122,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamReflect_8122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamReflect_8122",
    testCategory,
    8122,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamAbsorbIgnored_8122()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidPsychicScreamAbsorbIgnored_8122",
    testCategory,
    8122,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end


function me.TestCombatEventSelfAvoidPsychicScreamDodge_8124()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamDodge_8124",
    testCategory,
    8124,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamParry_8124()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamParry_8124",
    testCategory,
    8124,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamImmune_8124()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamImmune_8124",
    testCategory,
    8124,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamMiss_8124()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamMiss_8124",
    testCategory,
    8124,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamBlock_8124()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamBlock_8124",
    testCategory,
    8124,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamResist_8124()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamResist_8124",
    testCategory,
    8124,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamReflect_8124()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamReflect_8124",
    testCategory,
    8124,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamAbsorbIgnored_8124()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidPsychicScreamAbsorbIgnored_8124",
    testCategory,
    8124,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end


function me.TestCombatEventSelfAvoidPsychicScreamDodge_10888()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamDodge_10888",
    testCategory,
    10888,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamParry_10888()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamParry_10888",
    testCategory,
    10888,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamImmune_10888()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamImmune_10888",
    testCategory,
    10888,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamMiss_10888()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamMiss_10888",
    testCategory,
    10888,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamBlock_10888()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamBlock_10888",
    testCategory,
    10888,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamResist_10888()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamResist_10888",
    testCategory,
    10888,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamReflect_10888()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamReflect_10888",
    testCategory,
    10888,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamAbsorbIgnored_10888()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidPsychicScreamAbsorbIgnored_10888",
    testCategory,
    10888,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainDodge_10894()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainDodge_10894",
    testCategory,
    10894,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainParry_10894()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainParry_10894",
    testCategory,
    10894,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainImmune_10894()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainImmune_10894",
    testCategory,
    10894,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainMiss_10894()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainMiss_10894",
    testCategory,
    10894,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainBlock_10894()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainBlock_10894",
    testCategory,
    10894,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainResist_10894()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainResist_10894",
    testCategory,
    10894,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainReflect_10894()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainReflect_10894",
    testCategory,
    10894,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_10894()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_10894",
    testCategory,
    10894,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainDodge_589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainDodge_589",
    testCategory,
    589,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainParry_589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainParry_589",
    testCategory,
    589,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainImmune_589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainImmune_589",
    testCategory,
    589,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainMiss_589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainMiss_589",
    testCategory,
    589,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainBlock_589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainBlock_589",
    testCategory,
    589,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainResist_589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainResist_589",
    testCategory,
    589,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainReflect_589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainReflect_589",
    testCategory,
    589,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_589()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_589",
    testCategory,
    589,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainDodge_594()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainDodge_594",
    testCategory,
    594,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainParry_594()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainParry_594",
    testCategory,
    594,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainImmune_594()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainImmune_594",
    testCategory,
    594,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainMiss_594()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainMiss_594",
    testCategory,
    594,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainBlock_594()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainBlock_594",
    testCategory,
    594,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainResist_594()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainResist_594",
    testCategory,
    594,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainReflect_594()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainReflect_594",
    testCategory,
    594,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_594()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_594",
    testCategory,
    594,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainDodge_970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainDodge_970",
    testCategory,
    970,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainParry_970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainParry_970",
    testCategory,
    970,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainImmune_970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainImmune_970",
    testCategory,
    970,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainMiss_970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainMiss_970",
    testCategory,
    970,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainBlock_970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainBlock_970",
    testCategory,
    970,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainResist_970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainResist_970",
    testCategory,
    970,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainReflect_970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainReflect_970",
    testCategory,
    970,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_970()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_970",
    testCategory,
    970,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainDodge_992()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainDodge_992",
    testCategory,
    992,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainParry_992()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainParry_992",
    testCategory,
    992,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainImmune_992()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainImmune_992",
    testCategory,
    992,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainMiss_992()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainMiss_992",
    testCategory,
    992,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainBlock_992()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainBlock_992",
    testCategory,
    992,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainResist_992()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainResist_992",
    testCategory,
    992,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainReflect_992()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainReflect_992",
    testCategory,
    992,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_992()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_992",
    testCategory,
    992,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainDodge_2767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainDodge_2767",
    testCategory,
    2767,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainParry_2767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainParry_2767",
    testCategory,
    2767,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainImmune_2767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainImmune_2767",
    testCategory,
    2767,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainMiss_2767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainMiss_2767",
    testCategory,
    2767,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainBlock_2767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainBlock_2767",
    testCategory,
    2767,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainResist_2767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainResist_2767",
    testCategory,
    2767,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainReflect_2767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainReflect_2767",
    testCategory,
    2767,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_2767()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_2767",
    testCategory,
    2767,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainDodge_10892()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainDodge_10892",
    testCategory,
    10892,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainParry_10892()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainParry_10892",
    testCategory,
    10892,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainImmune_10892()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainImmune_10892",
    testCategory,
    10892,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainMiss_10892()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainMiss_10892",
    testCategory,
    10892,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainBlock_10892()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainBlock_10892",
    testCategory,
    10892,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainResist_10892()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainResist_10892",
    testCategory,
    10892,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainReflect_10892()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainReflect_10892",
    testCategory,
    10892,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_10892()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_10892",
    testCategory,
    10892,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainDodge_10893()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainDodge_10893",
    testCategory,
    10893,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainParry_10893()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainParry_10893",
    testCategory,
    10893,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainImmune_10893()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainImmune_10893",
    testCategory,
    10893,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainMiss_10893()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainMiss_10893",
    testCategory,
    10893,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainBlock_10893()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainBlock_10893",
    testCategory,
    10893,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainResist_10893()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainResist_10893",
    testCategory,
    10893,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainReflect_10893()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainReflect_10893",
    testCategory,
    10893,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_10893()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_10893",
    testCategory,
    10893,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidSilenceDodge_15487()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSilenceDodge_15487",
    testCategory,
    15487,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidSilenceParry_15487()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSilenceParry_15487",
    testCategory,
    15487,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidSilenceImmune_15487()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSilenceImmune_15487",
    testCategory,
    15487,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSilenceMiss_15487()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSilenceMiss_15487",
    testCategory,
    15487,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSilenceBlock_15487()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSilenceBlock_15487",
    testCategory,
    15487,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidSilenceResist_15487()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSilenceResist_15487",
    testCategory,
    15487,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidSilenceReflect_15487()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSilenceReflect_15487",
    testCategory,
    15487,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidSilenceAbsorbIgnored_15487()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidSilenceAbsorbIgnored_15487",
    testCategory,
    15487,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidVampiricEmbraceDodge_15286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidVampiricEmbraceDodge_15286",
    testCategory,
    15286,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidVampiricEmbraceParry_15286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidVampiricEmbraceParry_15286",
    testCategory,
    15286,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidVampiricEmbraceImmune_15286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidVampiricEmbraceImmune_15286",
    testCategory,
    15286,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidVampiricEmbraceMiss_15286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidVampiricEmbraceMiss_15286",
    testCategory,
    15286,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidVampiricEmbraceBlock_15286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidVampiricEmbraceBlock_15286",
    testCategory,
    15286,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidVampiricEmbraceResist_15286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidVampiricEmbraceResist_15286",
    testCategory,
    15286,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidVampiricEmbraceReflect_15286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidVampiricEmbraceReflect_15286",
    testCategory,
    15286,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidVampiricEmbraceAbsorbIgnored_15286()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidVampiricEmbraceAbsorbIgnored_15286",
    testCategory,
    15286,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
