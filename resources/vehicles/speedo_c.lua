--[[
Copyright (c) 2010 MTA: Paradise

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
]]

local screenX, screenY = guiGetScreenSize( )
local label, label2

addEventHandler( "onClientResourceStart", resourceRoot,
	function( )
		label = guiCreateLabel( 0, 0, screenX, 15, "", false )
		label2 = guiCreateLabel( 0, 0, screenX, 15, "", false )
		guiSetAlpha( label, 0.5 )
		guiSetAlpha( label2, 0.5 )
	end
)

addEventHandler( "onClientRender", root,
	function( )
		local vehicle = getPedOccupiedVehicle( getLocalPlayer( ) )
		if vehicle then
			local fuel = getElementData( vehicle, "fuel" ) or "N/A"
			if type( fuel ) == 'number' then
				fuel = fuel .. '%'
			end
			
			guiSetText( label, "Fuel: " .. fuel, false )
			guiSetSize( label, guiLabelGetTextExtent( label ) + 5, 14, false )
			guiSetPosition( label, screenX - guiLabelGetTextExtent( label ) - 5, screenY - 39, false )
			
			--
			
			local speed = ( function( x, y, z ) return math.floor( math.sqrt( x*x + y*y + z*z ) * 155 ) .. " km/h" end )( getElementVelocity( vehicle ) ) or "N/A"
			
			guiSetText( label2, "Speed: " .. speed, false )
			guiSetSize( label2, guiLabelGetTextExtent( label2 ) + 5, 14, false )
			guiSetPosition( label2, screenX - guiLabelGetTextExtent( label2 ) - 5, screenY - 51, false )
		else
			guiSetText( label, "" )
		end
	end
)