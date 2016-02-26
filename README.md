# week_5_lab
Finder with Settings Screen
Github Repo Finder with Settings Screen
This exercise extends your GitHub Repo Finder to add a new screen where the user can filter his / her search by minimum number of stars and / or coding language.

GitHub

We will practice handling form input and passing data back from a view controller.

Getting Started
The checkpoints below should be implemented as pairs. In pair programming, there are two roles: supervisor and driver.

The supervisor makes the decision on what step to do next. Their job is to describe the step using high level language ("Let's print out something when the user is scrolling"). They also have a browser open in case they need to do any research. The driver is typing and their role is to translate the high level task into code ("Set the scroll view delegate, implement the didScroll method").

After you finish each checkpoint, switch the supervisor and driver roles. The person on the right will be the first supervisor.

Milestone 1: Setup
Open the GithubDemo.xcworkspace from the last GitHub Repo Finder lab.
We'll be using the GitHub Search API.
Milestone 2: Allow Filtering by Number of Stars
Add a settings button to the left of the search bar:

For buttons in the navigation bar, you can use a BarButtonItem in Interface Builder.
Tapping on the settings button should modally present a SearchSettingsViewController:

To add a navigation bar to your SearchSettingsViewController, you can embed it inside a navigation controller via the Editor -> Embed In -> Navigation Controller menu option.
The SearchSettingsViewController should have a single setting for the minimum number of stars a repo needs to have.

This should be represented by a slider.
You'll need a way to pass the settings information between the RepoResultsViewController and your SearchSettingsViewController. This can be done in prepareForSegue.

// RepoResultsViewController.swift

override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let navController = segue.destinationViewController as! UINavigationController
    let vc = navController.topViewController as! SearchSettingsViewController
    vc.settings =   // ... Search Settings ...
}
To communicate the settings from the SearchSettingsViewController back to the RepoResultsViewController, we'll use the delegate pattern and create a protocol:

protocol SettingsPresentingViewControllerDelegate: class {
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()
}
Then we'll create a property inside of the SearchSettingsViewController:

weak var delegate: SettingsPresentingViewControllerDelegate?
There is a save UIBarButtonItem for settings. When the save button is tapped the settings are saved and applied to the search immediately.

There is a cancel UIBarButtonItem. Tapping on the cancel button returns to the main search results and discards any changes to the settings so that they are not reflected once the settings screen is opened the next time.

In order to discard any changes when the cancel button is tapped, you'll have to store a copy of the settings information in the settings view controller.
In Swift a quick way to make it easy to copy basic data objects (including arrays and maps) is by embedding them inside a struct. For example, changing the GithubRepoSearchSettings class to a struct makes it so that any assignment (via the = operator) creates a copy instead of a pointer to the object.
Implement the actions for when each UIBarButtonItem is tapped:

@IBAction func saveButtonTapped(sender: UIBarButtonItem) {
    self.delegate?.didSaveSettings(settings)
}

@IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
    self.delegate?.didCancelSettings()
}
When we segue from the RepoResultsViewController to the SearchSettingsViewController, we'll want to set the RepoResultsViewController as the delegate:

 // RepoResultsViewController.swift

 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     let navController = segue.destinationViewController as! UINavigationController
     let vc = navController.topViewController as! SearchSettingsViewController
     vc.settings = // ... Search Settings ...
     vc.delegate = self
}
Bonus 1: Allow Filtering by Language
The settings view controller should use a table view to display all settings.
There should be a setting for whether to filter by language. This setting is controlled by a toggle switch.
When the language filter toggle is on, a list of languages should appear in the table.
Tapping on a language toggles whether it will be included in the search.
Bonus 2: Configurable Sort Order
Add an option to the settings view controller for sorting search results based on either stars, forks, or relevance
