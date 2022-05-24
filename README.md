# state_management

A new Flutter project.

## Getting Started

FutureBuilder is a StatefulWidget ,it receives a parameter
that is a function that returns “Future”, This method just
processes the “future” function and for each state emitted.

Stream builder is similar to the broadcast receiver (radio station),
which will send the values even if there is no any receiver.

## Project Structure:
```
lib
├── main                                # Entry point
├── widget                              # All the common widgets
│    └── app_button                      # Common button used in the home screen
├── ui
│   └── home screen
├── model
│   └── user model                      # Common user's model used in API
├── network
│   └── api call                        # API calls
│   └── api methods                     # Common methods used in API
│   # Features can be divided into packages
├── change_notifier                     # Counter example using Change notifier
│   ├── controller                      # State management logic sits here
│   ├── ui
│       ├── widget                      # widgets used only in the screen
│       └── screen                      # screen ui design
├── future_builder                      # Feature builder demo of API call
│   ├── controller                      # State management logic sits here
│   ├── ui
│       ├── widget                      # widgets used only in the screen
│       └── screen                      # screen ui design
├── stream_builder                      # Stream builder demo of counter and API
│   ├── controller                      # State management logic sits here
│   ├── ui
│       ├── widget                      # widgets used only in the screen
│       └── screen                      # screen ui design
│           └── stream_builder_home     # Counter demo using stream builder
│           └── stream_builder_api_home # API demo using stream builder
│           └── stream_builder_combined # Counter and API demo using stream builder
└── ...
```