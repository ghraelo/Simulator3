#pragma once

#include "SimState.h"
#include "GUIRenderer.h"

#include <nanovg\nanovg.h>
#include <nanovg\nanovg_gl.h>

enum NextState {NS_MenuState, NS_NoVisualisationState, NS_MainState};

struct UIState
{
	bool showMenu;
	int scroll;
	int scrollarea1;
	bool mouseOverMenu;
	bool chooseTest;
};

class MenuState : public SimState
{
public:
	MenuState();
	void Init(SimEngine & se) override;
	void Cleanup() override;
	void Update(SimEngine& se) override;
	void Draw(SimEngine& se) override;
	void HandleEvents(SimEngine& se) override;
	void OnScroll(double scrollOffset) override;
private:
	UIState ui;
	const float menuWidth = 0.4f;
	const float menuHeight = 0.2f;
	GUIRenderer guiRenderer;
	int scroll = 0;
	NextState nextState;
};