CombatActions.Bombard.GetActionDescription = function(self, units)

    local attacks = 1

    local unit = units[1]

    if not unit.team.player_team then
        attacks = unit and (unit:GetUIActionPoints() / (self:ResolveValue("ap_per_shot")*const.Scale.AP)) or 1
    else 
        attacks = HUDAGetMaxAttacks(self, units[1])
    end

    attacks = HUDAGetMaxAttacks(self, units[1])

    return T {
        self.Description,
        attacks = attacks
    }
end

CombatActions.Bombard.GetUIState = function(self, units, args)

    attacks = HUDAGetMaxAttacks(self, units[1])

    if attacks < 1 then
        return "disabled", AttackDisableReasons.NoAP
    end

    return CombatActionGenericAttackGetUIState(self, units, args)

end

CombatActions.Bombard.GetMinAimRange = function()
    return 15
end

CombatActions.Bombard.GetActionResults = function(self, unit, args)

    HUDAPrintAttacker(unit)

    local weapon = self:GetAttackWeapons(unit, args)
    local target = ResolveGrenadeTargetPos(args.target)
    local ammos = weapon and unit:GetAvailableAmmos(weapon, nil, "unique")
    if not weapon or not target or not ammos then
        return {}
    end
    local args = table.copy(args)
    local cost_ap = args.spent_ap or self:GetAPCost(unit)

    if unit.team.player_team then
        weapon.BombardRadius = (self.bombard_radius * self.bombard_shots) / 3
        args.bombard_shots = self.bombard_shots
    else
        args.bombard_shots = cost_ap / (self:ResolveValue("ap_per_shot")*const.Scale.AP)
    end

    args.weapon = weapon
    args.target = target
    args.ordnance = args.ordnance or ammos[1]
    args.can_use_covers = false
    
    local attack_args = unit:PrepareAttackArgs(self.id, args)
    local results = weapon:GetAttackResults(self, attack_args)
    return results, attack_args
end

CombatActions.Bombard.UIBegin = function(self, units, args)

    print("Bombard.UIBegin")

    HUDAPrintAttacker(units[1])

    if units[1].team.player_team then
        local dlg = GetDialog("MortarDialog")
        local spdlg = GetDialog("SpacingDialog")
        if dlg then
            dlg:Close()
        end
        local spdlg = GetDialog("SpacingDialog")
        if spdlg then
            spdlg:Close()
        end
        if self.bombardThread then
            DeleteThread(self.bombardThread)
            self.bombardThread = false
        end
        self.bombardThread = CreateRealTimeThread(function()
            local num_shots = HUDAGetMaxAttacks(self, units[1])
            local base = GetDialog("IModeExploration")
            dlg = XTemplateSpawn("MortarDialog", base)
            Dialogs["MortarDialog"] = dlg
            Dialogs[dlg] = "MortarDialog"
            if (num_shots or 0) > 1 then
                dlg[2][2].visible = true
            end
            if (num_shots or 0) > 2 then
                dlg[2][3].visible = true
            end
            WaitMsg("RoundsSelected")
            self.bombard_shots = dlg.mortarRounds
            if self.bombard_shots > 1 then
                spdlg = XTemplateSpawn("SpacingDialog", base)
                Dialogs["SpacingDialog"] = spdlg
                Dialogs[spdlg] = "SpacingDialog"
                WaitMsg("SpacingSelected")
                self.bombard_radius = spdlg.radius
            else
                self.bombard_radius = 0
            end
            CombatActionAttackStart(self, units, args, "IModeCombatAreaAim")
        end)
    else
        CombatActionAttackStart(self, units, args, "IModeCombatAreaAim")
    end
end