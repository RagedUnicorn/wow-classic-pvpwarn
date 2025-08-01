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
mod.testCombatEventsEnemyAvoidPriest = me

me.tag = "TestCombatEventsEnemyAvoidPriest"

local testCategory = "priest"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testenemycombatevent priest")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    if type(completionCallback) == "function" then
      completionCallback()
    end
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueDodge_19280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueBlock_19280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueParry_19280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueMiss_19280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueResist_19280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueImmune_19280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueReflect_19280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_19280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueDodge_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueBlock_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueParry_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueMiss_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueResist_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueImmune_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueReflect_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueDodge_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueBlock_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueParry_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueMiss_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueResist_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueImmune_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueReflect_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueDodge_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueBlock_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueParry_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueMiss_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueResist_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueImmune_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueReflect_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueDodge_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueParry_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueImmune_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueMiss_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueBlock_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueResist_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueReflect_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueDodge_19279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueParry_19279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueImmune_19279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueMiss_19279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueBlock_19279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueResist_19279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueReflect_19279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_19279)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutDodge_15326)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutParry_15326)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutImmune_15326)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutMiss_15326)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutBlock_15326)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutResist_15326)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutReflect_15326)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutAbsorbIgnored_15326)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutDodge_15268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutParry_15268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutImmune_15268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutMiss_15268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutBlock_15268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutResist_15268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutReflect_15268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutAbsorbIgnored_15268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutDodge_15323)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutParry_15323)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutImmune_15323)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutMiss_15323)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutBlock_15323)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutResist_15323)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutReflect_15323)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutAbsorbIgnored_15323)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutDodge_15324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutParry_15324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutImmune_15324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutMiss_15324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutBlock_15324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutResist_15324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutReflect_15324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutAbsorbIgnored_15324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutDodge_15325)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutParry_15325)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutImmune_15325)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutMiss_15325)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutBlock_15325)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutResist_15325)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutReflect_15325)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlackoutAbsorbIgnored_15325)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnDodge_10876)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnParry_10876)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnImmune_10876)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnMiss_10876)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnBlock_10876)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnResist_10876)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnReflect_10876)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_10876)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnDodge_8129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnParry_8129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnImmune_8129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnMiss_8129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnBlock_8129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnResist_8129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnReflect_8129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_8129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnDodge_8131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnParry_8131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnImmune_8131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnMiss_8131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnBlock_8131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnResist_8131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnReflect_8131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_8131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnDodge_10874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnParry_10874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnImmune_10874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnMiss_10874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnBlock_10874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnResist_10874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnReflect_10874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_10874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnDodge_10875)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnParry_10875)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnImmune_10875)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnMiss_10875)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnBlock_10875)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnResist_10875)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnReflect_10875)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_10875)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlDodge_10912)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlParry_10912)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlImmune_10912)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlMiss_10912)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlBlock_10912)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlResist_10912)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlReflect_10912)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlAbsorbIgnored_10912)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlDodge_605)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlParry_605)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlImmune_605)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlMiss_605)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlBlock_605)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlResist_605)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlReflect_605)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlAbsorbIgnored_605)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlDodge_10911)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlParry_10911)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlImmune_10911)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlMiss_10911)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlBlock_10911)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlResist_10911)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlReflect_10911)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMindControlAbsorbIgnored_10911)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamDodge_10890)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamParry_10890)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamImmune_10890)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamMiss_10890)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamBlock_10890)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamResist_10890)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamReflect_10890)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamAbsorbIgnored_10890)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamDodge_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamParry_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamImmune_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamMiss_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamBlock_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamResist_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamReflect_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamAbsorbIgnored_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamDodge_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamParry_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamImmune_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamMiss_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamBlock_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamResist_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamReflect_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamAbsorbIgnored_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamDodge_10888)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamParry_10888)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamImmune_10888)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamMiss_10888)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamBlock_10888)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamResist_10888)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamReflect_10888)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPsychicScreamAbsorbIgnored_10888)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainDodge_10894)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainParry_10894)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainImmune_10894)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainMiss_10894)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainBlock_10894)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainResist_10894)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainReflect_10894)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_10894)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainDodge_589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainParry_589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainImmune_589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainMiss_589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainBlock_589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainResist_589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainReflect_589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainDodge_594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainParry_594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainImmune_594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainMiss_594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainBlock_594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainResist_594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainReflect_594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainDodge_970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainParry_970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainImmune_970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainMiss_970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainBlock_970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainResist_970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainReflect_970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainDodge_992)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainParry_992)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainImmune_992)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainMiss_992)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainBlock_992)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainResist_992)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainReflect_992)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_992)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainDodge_2767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainParry_2767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainImmune_2767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainMiss_2767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainBlock_2767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainResist_2767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainReflect_2767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_2767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainDodge_10892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainParry_10892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainImmune_10892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainMiss_10892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainBlock_10892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainResist_10892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainReflect_10892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_10892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainDodge_10893)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainParry_10893)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainImmune_10893)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainMiss_10893)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainBlock_10893)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainResist_10893)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainReflect_10893)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_10893)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSilenceDodge_15487)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSilenceParry_15487)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSilenceImmune_15487)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSilenceMiss_15487)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSilenceBlock_15487)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSilenceResist_15487)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSilenceReflect_15487)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSilenceAbsorbIgnored_15487)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidVampiricEmbraceDodge_15286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidVampiricEmbraceParry_15286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidVampiricEmbraceImmune_15286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidVampiricEmbraceMiss_15286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidVampiricEmbraceBlock_15286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidVampiricEmbraceResist_15286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidVampiricEmbraceReflect_15286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidVampiricEmbraceAbsorbIgnored_15286)
end

function me.TestCombatEventEnemyAvoidDevouringPlagueDodge_19280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueDodge_19280",
    testCategory,
    19280,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueBlock_19280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueBlock_19280",
    testCategory,
    19280,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueParry_19280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueParry_19280",
    testCategory,
    19280,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueMiss_19280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueMiss_19280",
    testCategory,
    19280,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueResist_19280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueResist_19280",
    testCategory,
    19280,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueImmune_19280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueImmune_19280",
    testCategory,
    19280,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueReflect_19280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueReflect_19280",
    testCategory,
    19280,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_19280()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_19280",
    testCategory,
    19280,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueDodge_2944()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueDodge_2944",
    testCategory,
    2944,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueBlock_2944()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueBlock_2944",
    testCategory,
    2944,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueParry_2944()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueParry_2944",
    testCategory,
    2944,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueMiss_2944()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueMiss_2944",
    testCategory,
    2944,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueResist_2944()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueResist_2944",
    testCategory,
    2944,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueImmune_2944()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueImmune_2944",
    testCategory,
    2944,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueReflect_2944()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueReflect_2944",
    testCategory,
    2944,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_2944()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_2944",
    testCategory,
    2944,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueDodge_19276()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueDodge_19276",
    testCategory,
    19276,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueBlock_19276()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueBlock_19276",
    testCategory,
    19276,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueParry_19276()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueParry_19276",
    testCategory,
    19276,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueMiss_19276()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueMiss_19276",
    testCategory,
    19276,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueResist_19276()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueResist_19276",
    testCategory,
    19276,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueImmune_19276()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueImmune_19276",
    testCategory,
    19276,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueReflect_19276()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueReflect_19276",
    testCategory,
    19276,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_19276()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_19276",
    testCategory,
    19276,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueDodge_19277()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueDodge_19277",
    testCategory,
    19277,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueBlock_19277()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueBlock_19277",
    testCategory,
    19277,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueParry_19277()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueParry_19277",
    testCategory,
    19277,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueMiss_19277()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueMiss_19277",
    testCategory,
    19277,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueResist_19277()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueResist_19277",
    testCategory,
    19277,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueImmune_19277()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueImmune_19277",
    testCategory,
    19277,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueReflect_19277()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueReflect_19277",
    testCategory,
    19277,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_19277()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_19277",
    testCategory,
    19277,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueDodge_19278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueDodge_19278",
    testCategory,
    19278,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueParry_19278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueParry_19278",
    testCategory,
    19278,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueImmune_19278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueImmune_19278",
    testCategory,
    19278,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueMiss_19278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueMiss_19278",
    testCategory,
    19278,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueBlock_19278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueBlock_19278",
    testCategory,
    19278,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueResist_19278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueResist_19278",
    testCategory,
    19278,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueReflect_19278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueReflect_19278",
    testCategory,
    19278,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_19278()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_19278",
    testCategory,
    19278,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueDodge_19279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueDodge_19279",
    testCategory,
    19279,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueParry_19279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueParry_19279",
    testCategory,
    19279,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueImmune_19279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueImmune_19279",
    testCategory,
    19279,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueMiss_19279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueMiss_19279",
    testCategory,
    19279,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueBlock_19279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueBlock_19279",
    testCategory,
    19279,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueResist_19279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueResist_19279",
    testCategory,
    19279,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueReflect_19279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueReflect_19279",
    testCategory,
    19279,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_19279()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_19279",
    testCategory,
    19279,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidBlackoutDodge_15326()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutDodge_15326",
    testCategory,
    15326,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidBlackoutParry_15326()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutParry_15326",
    testCategory,
    15326,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidBlackoutImmune_15326()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutImmune_15326",
    testCategory,
    15326,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidBlackoutMiss_15326()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutMiss_15326",
    testCategory,
    15326,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidBlackoutBlock_15326()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutBlock_15326",
    testCategory,
    15326,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidBlackoutResist_15326()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutResist_15326",
    testCategory,
    15326,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidBlackoutReflect_15326()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutReflect_15326",
    testCategory,
    15326,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidBlackoutAbsorbIgnored_15326()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidBlackoutAbsorbIgnored_15326",
    testCategory,
    15326,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidBlackoutDodge_15268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutDodge_15268",
    testCategory,
    15268,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidBlackoutParry_15268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutParry_15268",
    testCategory,
    15268,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidBlackoutImmune_15268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutImmune_15268",
    testCategory,
    15268,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidBlackoutMiss_15268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutMiss_15268",
    testCategory,
    15268,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidBlackoutBlock_15268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutBlock_15268",
    testCategory,
    15268,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidBlackoutResist_15268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutResist_15268",
    testCategory,
    15268,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidBlackoutReflect_15268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutReflect_15268",
    testCategory,
    15268,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidBlackoutAbsorbIgnored_15268()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidBlackoutAbsorbIgnored_15268",
    testCategory,
    15268,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidBlackoutDodge_15323()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutDodge_15323",
    testCategory,
    15323,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidBlackoutParry_15323()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutParry_15323",
    testCategory,
    15323,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidBlackoutImmune_15323()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutImmune_15323",
    testCategory,
    15323,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidBlackoutMiss_15323()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutMiss_15323",
    testCategory,
    15323,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidBlackoutBlock_15323()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutBlock_15323",
    testCategory,
    15323,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidBlackoutResist_15323()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutResist_15323",
    testCategory,
    15323,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidBlackoutReflect_15323()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutReflect_15323",
    testCategory,
    15323,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidBlackoutAbsorbIgnored_15323()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidBlackoutAbsorbIgnored_15323",
    testCategory,
    15323,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidBlackoutDodge_15324()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutDodge_15324",
    testCategory,
    15324,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidBlackoutParry_15324()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutParry_15324",
    testCategory,
    15324,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidBlackoutImmune_15324()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutImmune_15324",
    testCategory,
    15324,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidBlackoutMiss_15324()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutMiss_15324",
    testCategory,
    15324,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidBlackoutBlock_15324()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutBlock_15324",
    testCategory,
    15324,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidBlackoutResist_15324()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutResist_15324",
    testCategory,
    15324,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidBlackoutReflect_15324()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutReflect_15324",
    testCategory,
    15324,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidBlackoutAbsorbIgnored_15324()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidBlackoutAbsorbIgnored_15324",
    testCategory,
    15324,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidBlackoutDodge_15325()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutDodge_15325",
    testCategory,
    15325,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidBlackoutParry_15325()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutParry_15325",
    testCategory,
    15325,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidBlackoutImmune_15325()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutImmune_15325",
    testCategory,
    15325,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidBlackoutMiss_15325()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutMiss_15325",
    testCategory,
    15325,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidBlackoutBlock_15325()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutBlock_15325",
    testCategory,
    15325,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidBlackoutResist_15325()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutResist_15325",
    testCategory,
    15325,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidBlackoutReflect_15325()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlackoutReflect_15325",
    testCategory,
    15325,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidBlackoutAbsorbIgnored_15325()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidBlackoutAbsorbIgnored_15325",
    testCategory,
    15325,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidManaBurnDodge_10876()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnDodge_10876",
    testCategory,
    10876,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidManaBurnParry_10876()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnParry_10876",
    testCategory,
    10876,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidManaBurnImmune_10876()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnImmune_10876",
    testCategory,
    10876,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidManaBurnMiss_10876()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnMiss_10876",
    testCategory,
    10876,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidManaBurnBlock_10876()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnBlock_10876",
    testCategory,
    10876,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidManaBurnResist_10876()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnResist_10876",
    testCategory,
    10876,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidManaBurnReflect_10876()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnReflect_10876",
    testCategory,
    10876,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_10876()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_10876",
    testCategory,
    10876,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidManaBurnDodge_8129()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnDodge_8129",
    testCategory,
    8129,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidManaBurnParry_8129()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnParry_8129",
    testCategory,
    8129,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidManaBurnImmune_8129()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnImmune_8129",
    testCategory,
    8129,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidManaBurnMiss_8129()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnMiss_8129",
    testCategory,
    8129,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidManaBurnBlock_8129()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnBlock_8129",
    testCategory,
    8129,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidManaBurnResist_8129()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnResist_8129",
    testCategory,
    8129,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidManaBurnReflect_8129()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnReflect_8129",
    testCategory,
    8129,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_8129()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_8129",
    testCategory,
    8129,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidManaBurnDodge_8131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnDodge_8131",
    testCategory,
    8131,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidManaBurnParry_8131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnParry_8131",
    testCategory,
    8131,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidManaBurnImmune_8131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnImmune_8131",
    testCategory,
    8131,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidManaBurnMiss_8131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnMiss_8131",
    testCategory,
    8131,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidManaBurnBlock_8131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnBlock_8131",
    testCategory,
    8131,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidManaBurnResist_8131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnResist_8131",
    testCategory,
    8131,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidManaBurnReflect_8131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnReflect_8131",
    testCategory,
    8131,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_8131()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_8131",
    testCategory,
    8131,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidManaBurnDodge_10874()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnDodge_10874",
    testCategory,
    10874,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidManaBurnParry_10874()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnParry_10874",
    testCategory,
    10874,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidManaBurnImmune_10874()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnImmune_10874",
    testCategory,
    10874,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidManaBurnMiss_10874()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnMiss_10874",
    testCategory,
    10874,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidManaBurnBlock_10874()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnBlock_10874",
    testCategory,
    10874,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidManaBurnResist_10874()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnResist_10874",
    testCategory,
    10874,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidManaBurnReflect_10874()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnReflect_10874",
    testCategory,
    10874,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_10874()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_10874",
    testCategory,
    10874,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidManaBurnDodge_10875()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnDodge_10875",
    testCategory,
    10875,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidManaBurnParry_10875()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnParry_10875",
    testCategory,
    10875,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidManaBurnImmune_10875()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnImmune_10875",
    testCategory,
    10875,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidManaBurnMiss_10875()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnMiss_10875",
    testCategory,
    10875,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidManaBurnBlock_10875()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnBlock_10875",
    testCategory,
    10875,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidManaBurnResist_10875()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnResist_10875",
    testCategory,
    10875,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidManaBurnReflect_10875()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnReflect_10875",
    testCategory,
    10875,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_10875()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_10875",
    testCategory,
    10875,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidMindControlDodge_10912()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlDodge_10912",
    testCategory,
    10912,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidMindControlParry_10912()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlParry_10912",
    testCategory,
    10912,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidMindControlImmune_10912()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlImmune_10912",
    testCategory,
    10912,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidMindControlMiss_10912()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlMiss_10912",
    testCategory,
    10912,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidMindControlBlock_10912()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlBlock_10912",
    testCategory,
    10912,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidMindControlResist_10912()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlResist_10912",
    testCategory,
    10912,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidMindControlReflect_10912()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlReflect_10912",
    testCategory,
    10912,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidMindControlAbsorbIgnored_10912()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidMindControlAbsorbIgnored_10912",
    testCategory,
    10912,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidMindControlDodge_605()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlDodge_605",
    testCategory,
    605,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidMindControlParry_605()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlParry_605",
    testCategory,
    605,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidMindControlImmune_605()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlImmune_605",
    testCategory,
    605,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidMindControlMiss_605()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlMiss_605",
    testCategory,
    605,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidMindControlBlock_605()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlBlock_605",
    testCategory,
    605,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidMindControlResist_605()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlResist_10912",
    testCategory,
    605,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidMindControlReflect_605()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlReflect_605",
    testCategory,
    605,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidMindControlAbsorbIgnored_605()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidMindControlAbsorbIgnored_605",
    testCategory,
    605,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidMindControlDodge_10911()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlDodge_10911",
    testCategory,
    10911,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidMindControlParry_10911()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlParry_10911",
    testCategory,
    10911,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidMindControlImmune_10911()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlImmune_10911",
    testCategory,
    10911,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidMindControlMiss_10911()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlMiss_10911",
    testCategory,
    10911,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidMindControlBlock_10911()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlBlock_10911",
    testCategory,
    10911,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidMindControlResist_10911()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlResist_10912",
    testCategory,
    10911,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidMindControlReflect_10911()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMindControlReflect_10911",
    testCategory,
    10911,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidMindControlAbsorbIgnored_10911()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidMindControlAbsorbIgnored_10911",
    testCategory,
    10911,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end


function me.TestCombatEventEnemyAvoidPsychicScreamDodge_10890()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamDodge_10890",
    testCategory,
    10890,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamParry_10890()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamParry_10890",
    testCategory,
    10890,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamImmune_10890()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamImmune_10890",
    testCategory,
    10890,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamMiss_10890()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamMiss_10890",
    testCategory,
    10890,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamBlock_10890()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamBlock_10890",
    testCategory,
    10890,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamResist_10890()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamResist_10890",
    testCategory,
    10890,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamReflect_10890()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamReflect_10890",
    testCategory,
    10890,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamAbsorbIgnored_10890()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidPsychicScreamAbsorbIgnored_10890",
    testCategory,
    10890,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end


function me.TestCombatEventEnemyAvoidPsychicScreamDodge_8122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamDodge_8122",
    testCategory,
    8122,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamParry_8122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamParry_8122",
    testCategory,
    8122,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamImmune_8122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamImmune_8122",
    testCategory,
    8122,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamMiss_8122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamMiss_8122",
    testCategory,
    8122,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamBlock_8122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamBlock_8122",
    testCategory,
    8122,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamResist_8122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamResist_8122",
    testCategory,
    8122,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamReflect_8122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamReflect_8122",
    testCategory,
    8122,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamAbsorbIgnored_8122()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidPsychicScreamAbsorbIgnored_8122",
    testCategory,
    8122,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end


function me.TestCombatEventEnemyAvoidPsychicScreamDodge_8124()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamDodge_8124",
    testCategory,
    8124,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamParry_8124()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamParry_8124",
    testCategory,
    8124,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamImmune_8124()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamImmune_8124",
    testCategory,
    8124,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamMiss_8124()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamMiss_8124",
    testCategory,
    8124,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamBlock_8124()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamBlock_8124",
    testCategory,
    8124,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamResist_8124()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamResist_8124",
    testCategory,
    8124,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamReflect_8124()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamReflect_8124",
    testCategory,
    8124,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamAbsorbIgnored_8124()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidPsychicScreamAbsorbIgnored_8124",
    testCategory,
    8124,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end


function me.TestCombatEventEnemyAvoidPsychicScreamDodge_10888()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamDodge_10888",
    testCategory,
    10888,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamParry_10888()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamParry_10888",
    testCategory,
    10888,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamImmune_10888()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamImmune_10888",
    testCategory,
    10888,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamMiss_10888()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamMiss_10888",
    testCategory,
    10888,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamBlock_10888()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamBlock_10888",
    testCategory,
    10888,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamResist_10888()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamResist_10888",
    testCategory,
    10888,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamReflect_10888()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPsychicScreamReflect_10888",
    testCategory,
    10888,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidPsychicScreamAbsorbIgnored_10888()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidPsychicScreamAbsorbIgnored_10888",
    testCategory,
    10888,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainDodge_10894()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainDodge_10894",
    testCategory,
    10894,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainParry_10894()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainParry_10894",
    testCategory,
    10894,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainImmune_10894()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainImmune_10894",
    testCategory,
    10894,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainMiss_10894()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainMiss_10894",
    testCategory,
    10894,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainBlock_10894()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainBlock_10894",
    testCategory,
    10894,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainResist_10894()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainResist_10894",
    testCategory,
    10894,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainReflect_10894()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainReflect_10894",
    testCategory,
    10894,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_10894()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_10894",
    testCategory,
    10894,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainDodge_589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainDodge_589",
    testCategory,
    589,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainParry_589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainParry_589",
    testCategory,
    589,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainImmune_589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainImmune_589",
    testCategory,
    589,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainMiss_589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainMiss_589",
    testCategory,
    589,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainBlock_589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainBlock_589",
    testCategory,
    589,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainResist_589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainResist_589",
    testCategory,
    589,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainReflect_589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainReflect_589",
    testCategory,
    589,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_589()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_589",
    testCategory,
    589,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainDodge_594()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainDodge_594",
    testCategory,
    594,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainParry_594()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainParry_594",
    testCategory,
    594,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainImmune_594()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainImmune_594",
    testCategory,
    594,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainMiss_594()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainMiss_594",
    testCategory,
    594,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainBlock_594()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainBlock_594",
    testCategory,
    594,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainResist_594()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainResist_594",
    testCategory,
    594,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainReflect_594()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainReflect_594",
    testCategory,
    594,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_594()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_594",
    testCategory,
    594,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainDodge_970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainDodge_970",
    testCategory,
    970,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainParry_970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainParry_970",
    testCategory,
    970,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainImmune_970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainImmune_970",
    testCategory,
    970,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainMiss_970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainMiss_970",
    testCategory,
    970,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainBlock_970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainBlock_970",
    testCategory,
    970,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainResist_970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainResist_970",
    testCategory,
    970,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainReflect_970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainReflect_970",
    testCategory,
    970,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_970()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_970",
    testCategory,
    970,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainDodge_992()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainDodge_992",
    testCategory,
    992,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainParry_992()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainParry_992",
    testCategory,
    992,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainImmune_992()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainImmune_992",
    testCategory,
    992,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainMiss_992()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainMiss_992",
    testCategory,
    992,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainBlock_992()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainBlock_992",
    testCategory,
    992,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainResist_992()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainResist_992",
    testCategory,
    992,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainReflect_992()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainReflect_992",
    testCategory,
    992,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_992()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_992",
    testCategory,
    992,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainDodge_2767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainDodge_2767",
    testCategory,
    2767,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainParry_2767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainParry_2767",
    testCategory,
    2767,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainImmune_2767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainImmune_2767",
    testCategory,
    2767,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainMiss_2767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainMiss_2767",
    testCategory,
    2767,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainBlock_2767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainBlock_2767",
    testCategory,
    2767,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainResist_2767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainResist_2767",
    testCategory,
    2767,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainReflect_2767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainReflect_2767",
    testCategory,
    2767,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_2767()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_2767",
    testCategory,
    2767,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainDodge_10892()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainDodge_10892",
    testCategory,
    10892,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainParry_10892()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainParry_10892",
    testCategory,
    10892,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainImmune_10892()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainImmune_10892",
    testCategory,
    10892,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainMiss_10892()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainMiss_10892",
    testCategory,
    10892,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainBlock_10892()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainBlock_10892",
    testCategory,
    10892,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainResist_10892()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainResist_10892",
    testCategory,
    10892,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainReflect_10892()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainReflect_10892",
    testCategory,
    10892,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_10892()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_10892",
    testCategory,
    10892,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainDodge_10893()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainDodge_10893",
    testCategory,
    10893,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainParry_10893()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainParry_10893",
    testCategory,
    10893,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainImmune_10893()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainImmune_10893",
    testCategory,
    10893,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainMiss_10893()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainMiss_10893",
    testCategory,
    10893,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainBlock_10893()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainBlock_10893",
    testCategory,
    10893,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainResist_10893()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainResist_10893",
    testCategory,
    10893,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainReflect_10893()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainReflect_10893",
    testCategory,
    10893,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_10893()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_10893",
    testCategory,
    10893,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidSilenceDodge_15487()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSilenceDodge_15487",
    testCategory,
    15487,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSilenceParry_15487()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSilenceParry_15487",
    testCategory,
    15487,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidSilenceImmune_15487()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSilenceImmune_15487",
    testCategory,
    15487,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidSilenceMiss_15487()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSilenceMiss_15487",
    testCategory,
    15487,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidSilenceBlock_15487()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSilenceBlock_15487",
    testCategory,
    15487,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidSilenceResist_15487()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSilenceResist_15487",
    testCategory,
    15487,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidSilenceReflect_15487()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSilenceReflect_15487",
    testCategory,
    15487,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidSilenceAbsorbIgnored_15487()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidSilenceAbsorbIgnored_15487",
    testCategory,
    15487,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidVampiricEmbraceDodge_15286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidVampiricEmbraceDodge_15286",
    testCategory,
    15286,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidVampiricEmbraceParry_15286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidVampiricEmbraceParry_15286",
    testCategory,
    15286,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidVampiricEmbraceImmune_15286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidVampiricEmbraceImmune_15286",
    testCategory,
    15286,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidVampiricEmbraceMiss_15286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidVampiricEmbraceMiss_15286",
    testCategory,
    15286,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidVampiricEmbraceBlock_15286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidVampiricEmbraceBlock_15286",
    testCategory,
    15286,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidVampiricEmbraceResist_15286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidVampiricEmbraceResist_15286",
    testCategory,
    15286,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidVampiricEmbraceReflect_15286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidVampiricEmbraceReflect_15286",
    testCategory,
    15286,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidVampiricEmbraceAbsorbIgnored_15286()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidVampiricEmbraceAbsorbIgnored_15286",
    testCategory,
    15286,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
