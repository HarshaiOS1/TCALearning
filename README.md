# TCALearning

TCA is unidirectional architecure, data flows in one direction

Essential components :
 
1. State: State is a struct that defines the data needed for the logic and UI (PTR : Its funny in fltuter & koltin jetpack this defines the user state of the componenet) (for understanding we can consider this to be sate of the data at that point!)
2. Action: Action is an enum that defines various actions trigerred from many sources, such as user, timer calls & api request results
3. Reducer: Reducer is a func that determines how actions will be processed and updates the state based on those actions (business logic here to handle action)
4. Effects: An event that modifies the state outside of its local context (let's see how in demo)
5. Store (ViewStore): The store manages all of the above. It receives an action and runs the reducer to modify the state.
