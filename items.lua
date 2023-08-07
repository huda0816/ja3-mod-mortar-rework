return {
PlaceObj('ModItemCode', {
	'name', "Bombard",
	'CodeFileName', "Code/Bombard.lua",
}),
PlaceObj('ModItemCode', {
	'name', "CombatAction",
	'CodeFileName', "Code/CombatAction.lua",
}),
PlaceObj('ModItemCode', {
	'name', "Custom",
	'CodeFileName', "Code/Custom.lua",
}),
PlaceObj('ModItemCode', {
	'name', "MortarOverrides",
	'CodeFileName', "Code/MortarOverrides.lua",
}),
PlaceObj('ModItemInventoryItemCompositeDef', {
	'Group', "Ammo - Ordnance",
	'Id', "MortarShell_HE",
	'object_class', "Ordnance",
	'RepairCost', 0,
	'Repairable', false,
	'Reliability', 100,
	'Icon', "UI/Icons/Items/mortar_shell_he",
	'DisplayName', T(807825550899, --[[ModItemInventoryItemCompositeDef MortarShell_HE DisplayName]] "Mortar Cartridge"),
	'DisplayNamePlural', T(819652322047, --[[ModItemInventoryItemCompositeDef MortarShell_HE DisplayNamePlural]] "Mortar Cartridges"),
	'Description', T(783466487649, --[[ModItemInventoryItemCompositeDef MortarShell_HE Description]] "Explosive Ordnance ammo for Mortars."),
	'CenterUnitDamageMod', 200,
	'CenterObjDamageMod', 500,
	'CenterAppliedEffects', {
		"Suppressed",
	},
	'AreaOfEffect', 4,
	'CenterAreaOfEffect', 2,
	'AreaAppliedEffects', {
		"Suppressed",
	},
	'PenetrationClass', 4,
	'BurnGround', false,
	'Caliber', "MortarShell",
	'BaseDamage', 30,
}),
PlaceObj('ModItemInventoryItemCompositeDef', {
	'Id', "MortarInventoryItem",
	'object_class', "Mortar",
	'Reliability', 70,
	'ScrapParts', 16,
	'Caliber', "MortarShell",
	'Entity', "Weapon_M224",
	'Icon', "UI/Icons/Weapons/M224",
	'DisplayName', T(111273562524, --[[ModItemInventoryItemCompositeDef MortarInventoryItem DisplayName]] "M224 Mortar"),
	'DisplayNamePlural', T(487139682291, --[[ModItemInventoryItemCompositeDef MortarInventoryItem DisplayNamePlural]] "M224 Mortars"),
	'Description', T(829888420671, --[[ModItemInventoryItemCompositeDef MortarInventoryItem Description]] "Lightweight system that allows for 60mm close support rain of fire or other ordnance. "),
	'AdditionalHint', T(283853790769, --[[ModItemInventoryItemCompositeDef MortarInventoryItem AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Bombards a remote area after a delay\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Cumbersome (no Free Move)"),
	'LargeItem', true,
	'Cumbersome', true,
	'UnitStat', "Explosives",
	'is_valuable', true,
	'Cost', 10000,
	'CritChanceScaled', 0,
	'MagazineSize', 6,
	'PenetrationClass', 4,
	'WeaponRange', 70,
	'Noise', 50,
	'HandSlot', "TwoHanded",
	'HolsterSlot', "Shoulder",
	'PreparedAttackType', "None",
	'ShootAP', 6000,
}),
PlaceObj('ModItemTextStyle', {
	DisabledRolloverTextColor = 4292594599,
	DisabledTextColor = 4292594599,
	RolloverTextColor = 4292594599,
	TextColor = 4292594599,
	TextFont = T(873849959861, --[[ModItemTextStyle MortarHeading TextFont]] "HMGothic Rough A, 28"),
	id = "MortarHeading",
}),
PlaceObj('ModItemXTemplate', {
	__is_kind_of = "XDialog",
	id = "MortarDialog",
	recreate_after_save = true,
	PlaceObj('XTemplateProperty', {
		'id', "mortarRounds",
		'editor', "number",
		'default', 1,
	}),
	PlaceObj('XTemplateProperty', {
		'id', "allowedRounds",
		'editor', "number",
		'default', 3,
	}),
	PlaceObj('XTemplateWindow', {
		'BorderWidth', 2,
		'HAlign', "center",
		'VAlign', "center",
		'MinWidth', 200,
		'MinHeight', 40,
		'LayoutMethod', "Grid",
		'BorderColor', RGBA(52, 55, 62, 230),
		'BackgroundRectGlowSize', 1,
		'BackgroundRectGlowColor', RGBA(32, 35, 47, 255),
		'HandleMouse', true,
	}, {
		PlaceObj('XTemplateWindow', {
			'Background', RGBA(52, 55, 61, 255),
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Padding', box(20, 2, 20, 2),
				'TextStyle', "MortarHeading",
				'Text', "Number of rounds",
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'Padding', box(20, 20, 20, 20),
			'GridY', 2,
			'LayoutMethod', "HList",
			'UniformColumnWidth', true,
			'BorderColor', RGBA(52, 55, 61, 230),
			'Background', RGBA(32, 35, 47, 215),
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XButton",
				'RolloverTemplate', "SmallRolloverGeneric",
				'RolloverAnchor', "custom",
				'RolloverText', T(412182825301, --[[ModItemXTemplate MortarDialog RolloverText]] "1 Round"),
				'HAlign', "left",
				'VAlign', "center",
				'MinWidth', 70,
				'MinHeight', 60,
				'MaxWidth', 70,
				'MaxHeight', 60,
				'FoldWhenHidden', true,
				'Background', RGBA(255, 255, 255, 0),
				'FocusedBackground', RGBA(255, 255, 255, 0),
				'OnPress', function (self, gamepad)
					self:GetParent():GetParent().mortarRounds = 1
					Msg("RoundsSelected")
					XDialog.Close(self:GetParent():GetParent())
				end,
				'RolloverBackground', RGBA(255, 255, 255, 0),
				'PressedBackground', RGBA(255, 255, 255, 0),
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'GridY', 3,
					'MouseCursor', "UI/Cursors/Hand.tga",
					'Image', "icons/mortar_shell_he",
					'ImageFit', "scale-down",
					'Angle', 3600,
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XButton",
				'RolloverTemplate', "SmallRolloverGeneric",
				'RolloverAnchor', "custom",
				'RolloverText', T(846992100649, --[[ModItemXTemplate MortarDialog RolloverText]] "2 Rounds"),
				'HAlign', "left",
				'VAlign', "center",
				'MinWidth', 85,
				'MinHeight', 60,
				'MaxWidth', 85,
				'MaxHeight', 60,
				'GridX', 2,
				'LayoutMethod', "HOverlappingList",
				'Visible', false,
				'FoldWhenHidden', true,
				'Background', RGBA(255, 255, 255, 0),
				'DisabledMouseCursor', "UI/Cursors/Hand.tga",
				'FocusedBackground', RGBA(255, 255, 255, 0),
				'OnPress', function (self, gamepad)
					self:GetParent():GetParent().mortarRounds = 2
					Msg("RoundsSelected")
					XDialog.Close(self:GetParent():GetParent())
				end,
				'RolloverBackground', RGBA(255, 255, 255, 0),
				'PressedBackground', RGBA(255, 255, 255, 0),
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'ZOrder', 10,
					'HAlign', "left",
					'Image', "icons/mortar_shell_he",
					'ImageFit', "scale-down",
					'Angle', 3300,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'HAlign', "right",
					'Image', "icons/mortar_shell_he",
					'ImageFit', "height",
					'Angle', 3600,
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XButton",
				'RolloverTemplate', "SmallRolloverGeneric",
				'RolloverAnchor', "custom",
				'RolloverText', T(129174984591, --[[ModItemXTemplate MortarDialog RolloverText]] "3 Rounds"),
				'HAlign', "left",
				'VAlign', "center",
				'MinWidth', 110,
				'MinHeight', 60,
				'MaxWidth', 110,
				'MaxHeight', 60,
				'GridX', 2,
				'LayoutMethod', "HOverlappingList",
				'Visible', false,
				'FoldWhenHidden', true,
				'Background', RGBA(255, 255, 255, 0),
				'FocusedBackground', RGBA(255, 255, 255, 0),
				'OnPress', function (self, gamepad)
					self:GetParent():GetParent().mortarRounds = 3
					Msg("RoundsSelected")
					XDialog.Close(self:GetParent():GetParent())
				end,
				'RolloverBackground', RGBA(255, 255, 255, 0),
				'PressedBackground', RGBA(255, 255, 255, 0),
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'ZOrder', 10,
					'HAlign', "left",
					'Image', "icons/mortar_shell_he",
					'ImageFit', "scale-down",
					'Angle', 3300,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'HAlign', "right",
					'Image', "icons/mortar_shell_he",
					'ImageFit', "height",
					'Angle', 3480,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'HAlign', "right",
					'Image', "icons/mortar_shell_he",
					'ImageFit', "height",
					'Angle', 3600,
				}),
				}),
			}),
		}),
	PlaceObj('XTemplateAction', {
		'ActionId', "idCloseRounds",
		'ActionName', T(106019977989, --[[ModItemXTemplate MortarDialog ActionName]] "Close"),
		'ActionShortcut', "Escape",
		'ActionGamepad', "ButtonB",
		'OnAction', function (self, host, source, ...)
			local dlg = GetDialog("MortarDialog")
			local spdlg = GetDialog("SpacingDialog")
			if dlg then
			dlg:Close()
			end
			if spdlg then
			spdlg:Close()
			end
		end,
	}),
}),
PlaceObj('ModItemXTemplate', {
	__is_kind_of = "XDialog",
	id = "SpacingDialog",
	recreate_after_save = true,
	PlaceObj('XTemplateProperty', {
		'id', "radius",
		'editor', "number",
		'default', 6,
	}),
	PlaceObj('XTemplateWindow', {
		'BorderWidth', 2,
		'HAlign', "center",
		'VAlign', "center",
		'MinWidth', 400,
		'MinHeight', 40,
		'MaxWidth', 400,
		'LayoutMethod', "Grid",
		'BorderColor', RGBA(52, 55, 62, 230),
		'BackgroundRectGlowSize', 1,
		'BackgroundRectGlowColor', RGBA(32, 35, 47, 255),
	}, {
		PlaceObj('XTemplateWindow', {
			'Background', RGBA(52, 55, 61, 255),
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Padding', box(20, 2, 20, 2),
				'TextStyle', "MortarHeading",
				'Text', "Mortar Round Spacing",
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'Padding', box(20, 20, 20, 20),
			'MaxWidth', 400,
			'GridY', 2,
			'LayoutMethod', "Grid",
			'UniformColumnWidth', true,
			'BorderColor', RGBA(52, 55, 61, 230),
			'Background', RGBA(32, 35, 47, 215),
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XButton",
				'RolloverTemplate', "SmallRolloverGeneric",
				'RolloverAnchor', "custom",
				'RolloverText', T(912877369245, --[[ModItemXTemplate SpacingDialog RolloverText]] "Narrow"),
				'HAlign', "center",
				'VAlign', "center",
				'MinWidth', 50,
				'MinHeight', 60,
				'MaxWidth', 50,
				'MaxHeight', 60,
				'Background', RGBA(120, 200, 43, 0),
				'FocusedBackground', RGBA(255, 255, 255, 0),
				'OnPress', function (self, gamepad)
					self:GetParent():GetParent().radius = 2
					Msg("SpacingSelected")
					XDialog.Close(self:GetParent():GetParent())
				end,
				'RolloverBackground', RGBA(255, 255, 255, 0),
				'PressedBackground', RGBA(255, 255, 255, 0),
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'GridY', 3,
					'MouseCursor', "UI/Cursors/Hand.tga",
					'Image', "icons/LegionRaider.dds",
					'ImageFit', "height",
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XButton",
				'RolloverTemplate', "SmallRolloverGeneric",
				'RolloverAnchor', "custom",
				'RolloverText', T(859317597928, --[[ModItemXTemplate SpacingDialog RolloverText]] "Normal"),
				'HAlign', "center",
				'VAlign', "center",
				'MinWidth', 100,
				'MinHeight', 60,
				'MaxWidth', 100,
				'MaxHeight', 60,
				'GridX', 2,
				'GridWidth', 2,
				'LayoutMethod', "HOverlappingList",
				'Background', RGBA(177, 22, 14, 0),
				'FocusedBackground', RGBA(255, 255, 255, 0),
				'OnPress', function (self, gamepad)
					self:GetParent():GetParent().radius = 4
					Msg("SpacingSelected")
					XDialog.Close(self:GetParent():GetParent())
				end,
				'RolloverBackground', RGBA(255, 255, 255, 0),
				'PressedBackground', RGBA(255, 255, 255, 0),
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'HAlign', "left",
					'Image', "icons/LegionRaider.dds",
					'ImageFit', "height",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'HAlign', "right",
					'Image', "icons/LegionRaider.dds",
					'ImageFit', "height",
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XButton",
				'RolloverTemplate', "SmallRolloverGeneric",
				'RolloverAnchor', "custom",
				'RolloverText', T(190122996884, --[[ModItemXTemplate SpacingDialog RolloverText]] "Wide"),
				'HAlign', "right",
				'VAlign', "center",
				'MinWidth', 140,
				'MinHeight', 60,
				'MaxWidth', 140,
				'MaxHeight', 60,
				'GridX', 3,
				'GridWidth', 3,
				'LayoutMethod', "HOverlappingList",
				'Background', RGBA(61, 122, 153, 0),
				'FocusedBackground', RGBA(255, 255, 255, 0),
				'OnPress', function (self, gamepad)
					self:GetParent():GetParent().radius = 6
					Msg("SpacingSelected")
					XDialog.Close(self:GetParent():GetParent())
				end,
				'RolloverBackground', RGBA(255, 255, 255, 0),
				'PressedBackground', RGBA(255, 255, 255, 0),
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'ZOrder', 10,
					'HAlign', "left",
					'Image', "icons/LegionRaider.dds",
					'ImageFit', "scale-down",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'HAlign', "center",
					'Image', "icons/LegionRaider.dds",
					'ImageFit', "height",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'HAlign', "right",
					'Image', "icons/LegionRaider.dds",
					'ImageFit', "height",
				}),
				}),
			}),
		}),
	PlaceObj('XTemplateAction', {
		'ActionId', "idCloseSpacing",
		'ActionName', T(419342847614, --[[ModItemXTemplate SpacingDialog ActionName]] "Close"),
		'ActionShortcut', "Escape",
		'ActionGamepad', "ButtonB",
		'OnAction', function (self, host, source, ...)
			local dlg = GetDialog("MortarDialog")
			local spdlg = GetDialog("SpacingDialog")
			if dlg then
			dlg:Close()
			end
			if spdlg then
			spdlg:Close()
			end
		end,
	}),
}),
}
