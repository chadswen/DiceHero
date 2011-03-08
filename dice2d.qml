import QtQuick 1.0

Item
	{
		id:		d6
		width:	256
		height:	256
		color: "red"
		
		Image
			{
				id: d6_image
				source: "sprites/d6_side.png"
				anchors.centerIn: parent
			}

		
		states:
		[
			State
				{
					name:	"still"
					PropertyChanges
						{
							target:	d6;
							source:	"sprites/d6_side.png";
						}
				}
			State
				{
					name:	"rolling"
					PropertyChanges
						{
							target:	d6;
							source:	"sprites/d6_corner.png";
						}
				}
		]
	}