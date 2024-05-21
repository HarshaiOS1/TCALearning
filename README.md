# TCALearning

TCA is unidirectional architecture, data flows in one direction

Essential components :
 
1. State: State is a struct that defines the data needed for the logic and UI (PTR : Its funny in fltuter & koltin jetpack this defines the user state of the componenet) (for understanding we can consider this to be sate of the data at that point!)
    a. added model for parsing as well
2. Action: Action is an enum that defines various actions trigerred from many sources, such as user, timer calls & api request results
3. Reducer: Reducer is a func that determines how actions will be processed and updates the state based on those actions (business logic here to handle action). Reducer contains
4. Effects: An event that modifies the state outside of its local context (let's see how in demo)
5. Store (ViewStore): The store manages all of the above. It receives an action and runs the reducer to modify the state.


Advantages : 
1. strict unidirectional data flow.
2. Modularity: encourages breaking down of application into smaller, composable components
3. 

Disadvantages: 
1. still in evolution mode
2. need fresh learning for new people joining team, as its not used widely
3. takes learning to adopt to new terms specific to architecture


