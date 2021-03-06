#pragma once


#include <memory>

class SimEngine;
class SimState;
typedef std::unique_ptr<SimState> SimStatePtr;

class SimState
{
public:
	SimState();
	virtual void Init(SimEngine & se) = 0;
	virtual void Cleanup() = 0;
	virtual void Update(SimEngine& se) = 0;
	virtual void Draw(SimEngine& se) = 0;
	virtual void HandleEvents(SimEngine& se) = 0;
	virtual void OnScroll(double scrollOffset) = 0;
	void ChangeState(SimEngine& se, SimStatePtr& state);
private:
};

typedef std::unique_ptr<SimState> SimStatePtr;