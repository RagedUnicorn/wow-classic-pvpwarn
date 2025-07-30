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

-- Test command registry for PVPWarn addon
-- This module registers all test commands and delegates to specific handlers
-- This module is only loaded in development builds

local mod = rgpvpw
local me = {}
mod.testCmdRegistry = me

me.tag = "TestCmdRegistry"

--[[
  Initialize test command registry
]]--
function me.Initialize()
  if not mod.cmd or not mod.cmd.RegisterCommand then
    mod.logger.LogError(me.tag, "Failed to register test commands - command module not available")
    return
  end

  -- Register test log window commands
  mod.cmd.RegisterCommand("testlog", function(args)
    if not mod.testLogCmd then
      mod.logger.LogError(me.tag, "TestLogCmd module not available")
      return
    end

    if #args > 0 then
      mod.testLogCmd.Handle(args[1])
    else
      mod.testLogCmd.ShowHelp()
    end
  end)

  -- Register sound test commands
  mod.cmd.RegisterCommand("testsound", function(args)
    if not mod.testSoundCmd then
      mod.logger.LogError(me.tag, "TestSoundCmd module not available")
      return
    end

    if #args > 0 then
      mod.testSoundCmd.HandleSound(args[1])
    else
      mod.testSoundCmd.ShowSoundHelp()
    end
  end)

  mod.cmd.RegisterCommand("testselfsound", function(args)
    if not mod.testSoundCmd then
      mod.logger.LogError(me.tag, "TestSoundCmd module not available")
      return
    end

    if #args > 0 then
      mod.testSoundCmd.HandleSelfSound(args[1])
    else
      mod.testSoundCmd.ShowSelfSoundHelp()
    end
  end)

  mod.cmd.RegisterCommand("testenemysound", function(args)
    if not mod.testSoundCmd then
      mod.logger.LogError(me.tag, "TestSoundCmd module not available")
      return
    end

    if #args > 0 then
      mod.testSoundCmd.HandleEnemySound(args[1])
    else
      mod.testSoundCmd.ShowEnemySoundHelp()
    end
  end)

  -- Register combat event test commands
  mod.cmd.RegisterCommand("testcombatevent", function(args)
    if not mod.testCombatEventCmd then
      mod.logger.LogError(me.tag, "TestCombatEventCmd module not available")
      return
    end

    if #args > 0 then
      mod.testCombatEventCmd.HandleCombatEvent(args[1])
    else
      mod.testCombatEventCmd.ShowCombatEventHelp()
    end
  end)

  mod.cmd.RegisterCommand("testselfcombatevent", function(args)
    if not mod.testCombatEventCmd then
      mod.logger.LogError(me.tag, "TestCombatEventCmd module not available")
      return
    end

    if #args > 0 then
      mod.testCombatEventCmd.HandleSelfCombatEvent(args[1])
    else
      mod.testCombatEventCmd.ShowSelfCombatEventHelp()
    end
  end)

  mod.cmd.RegisterCommand("testenemycombatevent", function(args)
    if not mod.testCombatEventCmd then
      mod.logger.LogError(me.tag, "TestCombatEventCmd module not available")
      return
    end

    if #args > 0 then
      mod.testCombatEventCmd.HandleEnemyCombatEvent(args[1])
    else
      mod.testCombatEventCmd.ShowEnemyCombatEventHelp()
    end
  end)

  -- Register test validation commands
  mod.cmd.RegisterCommand("testvalidation", function(args)
    if not mod.testValidationCmd then
      mod.logger.LogError(me.tag, "TestValidationCmd module not available")
      return
    end
    
    if #args > 0 then
      mod.testValidationCmd.HandleValidation(args[1])
    else
      mod.testValidationCmd.ShowValidationHelp()
    end
  end)

  mod.logger.LogDebug(me.tag, "Test commands registered")
end
