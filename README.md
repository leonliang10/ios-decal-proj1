<<<<<<< HEAD
# Homework 2: Custom Keyboard

## Due
Tuesday, February 16 at 11:59 PM

## Description
In last week's homework, you explored Swift in the Playground. Playground is a
great place to test things out, but it's now time to build your first app!  In
this assignment, we will be exploring Xcode even further via the Storyboard. As
discussed in lecture, Storyboard is a powerful way to sketch out designs and
translate them to working code. 

Our app will be a custom keyboard -- think emojis, but with our own buttons and
interactions. Your job will be to fill out the code to successfully link up
interactions between the user and the keyboard. In coming up with your own
keyboard designs, be creative! We encourage you to create something that you
think is funny, cool, useful, etc.
=======
# Project 1: To-Do List App

## Due
Tuesday, March 1 at 11:59 PM

## Description 
In Project 1, you will build your own Utility app - a To-Do List.  As you would
expect, the app is simple. You are able to view your existing tasks, mark a task
as completed, delete a task, add a new task, and view stats about how many tasks
you have completed in 24 hours. As long as your application conforms every one
of our required criteria (see below), you can add whatever additional features,
views, UI, etc. you want. 
>>>>>>> 4778afdee23d5c9cfbd26d416623c99cbccd9073

## Instructions
1. Fork the assignment's repository from (https://github.com/iosdecal).
2. Clone your forked repository to your local machine (the URL should contain
   YOUR_USERNAME/ios-decal-..).
<<<<<<< HEAD
3. **Add to KeyboardViewController.swift and Keyboard.xib**
  * Required
    * A "Next Keyboard" button (done for you already, but feel free to change
            the image, text, etc.)
    * A "Return" button
    * A "Delete" button
    * Various input buttons (e.g. ASCII Text, Unicode, Emojis, GIFs, etc.)
4. Add, commit, and push your modified file(s) to your forked remote repository

## Video Demo

[Setup video from last semester](https://youtu.be/qY8V69PxP8Q)

## Example Custom Keyboards

[Boring but pretty keyboard](https://cdn0.vox-cdn.com/thumbor/qaDoESKR2hFs2I3mK53TZbj59os=/1000x0/filters:no_upscale%28%29/cdn0.vox-cdn.com/uploads/chorus_asset/file/923634/IMG_0274.0.PNG)

[Kaomoji Keyboard](http://i.imgur.com/MDNB94z.jpg)

[SwiftKey](https://cdn3.vox-cdn.com/thumbor/aunHOJvl8DJWuezzt8Dlls7SyLs=/1000x0/filters:no_upscale%28%29/cdn0.vox-cdn.com/uploads/chorus_asset/file/924270/SwiftKey_screenshot_1.0.jpg)

[Kanye Keyboard](https://raw.githubusercontent.com/SamStone92/kanyekeyboad/master/screenshots/2.png)
=======
3. Add an upstream remote that points to our original repository.
4. **Create a To-Do List app**
  * Required
    * General
      * Create a Universal app when you construct your Xcode project.
      * UI must scale to iPhone 6 and up and all iPads in both Portait and
      Landscape orientations.
        * Hint: Think Auto-Layout. For UILabels, autoshrink in the Attributes
        Inspector is also useful. 
    * To-Do List Table View
      * Ability to visually mark a task as completed
      * Tasks must automatically clear 24 hours after they are marked as
      completed
      * Ability to delete a task
      * Button to add a To-Do Item (goes to Add To-Do Item View)
      * Button to view Stats (goes to Daily Stats View)
    * Add To-Do Item View
      * Ability to add a task, where entering text and confirming returns to the
      To-Do List Table View, now updated with the new task added
      * Ability to cancel and return to To-Do List Table View without adding a
      task
    * Daily Stats View 
      * Displays the number of tasks completed in the past 24 hours
      * Ability to return to To-Do List Table View
  * Optional
    * Make the data persistent, so that when you close the application and
    reopen it, your preexisting tasks are restored.
5. Add, commit, and push your modified file(s) to your forked remote repository.
>>>>>>> 4778afdee23d5c9cfbd26d416623c99cbccd9073
