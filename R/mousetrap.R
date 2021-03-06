#' mousetrap: Process and Analyze Mouse-Tracking Data
#' 
#' The mousetrap package provides functions for importing, preprocessing, 
#' analyzing, aggregating, and visualizing mouse-tracking data. In the 
#' following, a brief overview of the functions in this package is given.
#' 
#' @section Import functions:
#'   
#'   The first step is to create a mousetrap data object. Depending on the input
#'   format, one of the following functions can be used. A detailed description
#'   (and example) of the resulting mousetrap data object can be found in
#'   \link{mt_example}.
#'   
#'   \link{mt_import_mousetrap} imports mouse-tracking data that were recorded
#'   using the \href{https://github.com/pascalkieslich/mousetrap-os}{mousetrap
#'   plug-ins} for OpenSesame.
#'   
#'   \link{mt_import_wide} imports mouse-tracking data saved in a wide format 
#'   (e.g., data exported from MouseTracker).
#'   
#'   \link{mt_import_long} imports mouse-tracking data saved in a long format. 
#'   (e.g., trajectories exported using the mt_reshape function from this 
#'   package).
#'   
#' @section Preprocessing functions:
#'   
#'   A number of functions are available that perform preprocessing operations 
#'   typically used before analyzing mouse-tracking data.
#'   
#'   \link{mt_remap_symmetric} remaps mouse trajectories so that they share a 
#'   common direction.
#'   
#'   \link{mt_exclude_initiation}	excludes the initial phase of a trial without 
#'   mouse movement.
#'   
#'   \link{mt_align_start} aligns the start position of trajectories.
#'   
#'   \link{mt_space_normalize} performs space-normalization by remapping all
#'   trajectories so that they share a common initial and final coordinate.
#'   
#'   \link{mt_time_normalize}	performs time-normalization, resulting in an
#'   identical number of samples for all trajectories.
#'   
#'   \link{mt_resample}	resamples trajectories such that samples occur at
#'   constant intervals of a specified length.
#'   
#'   \link{mt_average} averages trajectory coordinates for time bins of constant
#'   duration.
#'   
#'   \link{mt_subset}	filters mouse-tracking data by trials, such that are only
#'   those meeting defined criteria are included.
#'   
#'   \link{mt_add_variables} adds new, self created variables to a trajectory 
#'   array.
#'   
#' @section Analysis functions:
#'   
#'   A number of different analysis procedures and summary statistics for mouse 
#'   trajectories have been established in the existing literature. The following 
#'   functions implement many of these approaches.
#'   
#'   \link{mt_derivatives} calculates distance, velocity, and 
#'   acceleration for trajectories.
#'   
#'   \link{mt_deviations} calculates the deviations from an idealized
#'   trajectory (straight line).
#'   
#'   \link{mt_measures}	calculates a set of mouse-tracking measures.
#'   
#'   \link{mt_sample_entropy}	calculates sample entropy.
#'   
#'   \link{mt_movement_angle}	calculates the initial movement angle.
#'   
#'   \link{mt_standardize} standardizes mouse-tracking measures onto a common 
#'   scale (individually for subsets of the data, e.g. z-scaled data per
#'   participant).
#'   
#'   \link{mt_check_bimodality}	assesses the bimodality of mouse-tracking
#'   measure distributions.
#'   
#'   \link{mt_check_resolution}	checks the (temporal) logging resolution of raw
#'   trajectories.
#'   
#' @section Reshaping and aggregation functions:
#'   
#'   A number of helper functions are provided for aggregating, plotting, and 
#'   exporting the multi-dimensional mouse trajectory arrays.
#'   
#'   \link{mt_reshape} is a general purpose reshaping and aggregation function
#'   for mousetrap data.
#'   
#'   \link{mt_aggregate} aggregates mouse-tracking data per condition.
#'   
#'   \link{mt_aggregate_per_subject}	aggregates mouse-tracking data per 
#'   (within subjects-) condition separately for each subject.
#'   
#' @section Visualization functions:
#'   
#'   The following functions can be used for plotting trajectory data, e.g., 
#'   individual and aggregated trajectories or velocity profiles.
#'   
#'   \link{mt_plot}	plots individual trajectory data.
#'   
#'   \link{mt_plot_aggregate}	plots aggregated trajectory data.
#'   
#'   \link{mt_plot_per_trajectory} creates a pdf with separate plots per 
#'   trajectory.
#'   
#'   \link{mt_plot_add_rect} adds rectangles to a trajectory plot.
#'   
#'   \link{mt_plot_riverbed} plots the relative frequency of a selected variable
#'   across time.
#'   
#' @section Helper functions:
#'   
#'   \link{bimodality_coefficient} calculates the bimodality coefficient.
#'   
#'   \link{scale_within} scales and centers variables within the levels of 
#'   another variable.
#'   
#'   \link{read_mousetracker} reads data that was exported from MouseTracker.
#'   
#'   
#' @examples
#' mt_example <- mt_import_mousetrap(mt_example_raw)
#' mt_example <- mt_remap_symmetric(mt_example)
#' mt_example <- mt_align_start(mt_example)
#' mt_example <- mt_time_normalize(mt_example)
#' mt_example <- mt_derivatives(mt_example)
#' mt_example <- mt_deviations(mt_example)
#' mt_example <- mt_measures(mt_example)
#' 
#' average_measures <- mt_aggregate(
#'   mt_example, use="measures",
#'   use_variables=c("MAD", "AD"),
#'   use2_variables="Condition"
#' )
#' 
#' mt_plot(mt_example,
#'   use="tn_trajectories",
#'   x="xpos", y="ypos", color="Condition"
#' )
#'         
#' mt_plot_aggregate(mt_example,
#'   use="tn_trajectories",
#'   x="xpos", y="ypos", color="Condition"
#' )
#' 
#' @docType package
#' @name mousetrap
NULL
#> NULL