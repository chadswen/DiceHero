import QtQuick 1.0

Item {
		id: d4
		width: 256
		height: 256
		color: "red"
		Image {
				id: d4_image
				source: "sprites/d4_side.png"
				anchors.centerIn: parent
			}

		states: [
				State {
						name: "still"
						PropertyChanges {
								target: d4;
								source: "sprites/d4_side.png";
							}
					}
				State {
					name: "rolling"
					PropertyChanges {
							target: d4;
							source: "sprites/d4_corner.png";
						}
					}
			]
	}
Item {
		id: d6
		width: 256
		height: 256
		color: "red"
		Image {
				id: d6_image
				source: "sprites/d6_side.png"
				anchors.centerIn: parent
			}
		Text {
             id: number
             anchors.centerIn: parent
			 horizontalAlignment: Text.AlignHCenter;
			 verticalAlignment: Text.AlignVCenter;
             color: "black"
             text: "X"
             font.pixelSize: 12
			 font.weight: Font.DemiBold
			 style: Text.Outline;
			 styleColor: "white" 
             smooth: true
			}

		states: [
				State {
						name: "still"
						PropertyChanges {
								target: d6;
								source: "sprites/d6_side.png";
							}
					}
				State {
					name: "rolling"
					PropertyChanges {
							target: d6;
							source: "sprites/d6_corner.png";
						}
					}
			]
	}
Item {
		id: d8
		width: 256
		height: 256
		color: "red"
		Image {
				id: d8_image
				source: "sprites/d8_side.png"
				anchors.centerIn: parent
			}

		states: [
				State {
						name: "still"
						PropertyChanges {
								target: d8;
								source: "sprites/d8_side.png";
							}
					}
				State {
					name: "rolling"
					PropertyChanges {
							target: d8;
							source: "sprites/d8_corner.png";
						}
					}
			]
	}
Item {
		id: d10
		width: 256
		height: 256
		color: "red"
		Image {
				id: d10_image
				source: "sprites/d10_side.png"
				anchors.centerIn: parent
			}

		states: [
				State {
						name: "still"
						PropertyChanges {
								target: d10;
								source: "sprites/d4_side.png";
							}
					}
				State {
					name: "rolling"
					PropertyChanges {
							target: d10;
							source: "sprites/d10_corner.png";
						}
					}
			]
	}
Item {
		id: d12
		width: 256
		height: 256
		color: "red"
		Image {
				id: d12_image
				source: "sprites/d12_side.png"
				anchors.centerIn: parent
			}

		states: [
				State {
						name: "still"
						PropertyChanges {
								target: d12;
								source: "sprites/d12_side.png";
							}
					}
				State {
					name: "rolling"
					PropertyChanges {
							target: d12;
							source: "sprites/d12_corner.png";
						}
					}
			]
	}
Item {
		id: d20
		width: 256
		height: 256
		color: "red"
		Image {
				id: d20_image
				source: "sprites/d20_side.png"
				anchors.centerIn: parent
			}

		states: [
				State {
						name: "still"
						PropertyChanges {
								target: d20;
								source: "sprites/d20_side.png";
							}
					}
				State {
					name: "rolling"
					PropertyChanges {
							target: d20;
							source: "sprites/d20_corner.png";
						}
					}
			]
	}