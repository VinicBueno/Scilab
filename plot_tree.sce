/*
Vinícius Bueno Macedo - Aerospace Engineer
email: viniiciusbueno0@gmail.com

Script to generate a fractal tree using recursion in Scilab.
The tree is drawn using a series of line segments, with each segment
splitting into two smaller segments at a certain angle from the parent.
*/

clc, clear, clf;
funcprot(0);

// Define a function to draw a branch, given its length, angle, depth, and left/right orientation
function branch(len, theta, depth, LR)
    // If the current depth is greater than 0, continue drawing branches
    if depth > 0
        // Translate the branch 3/4 of its length away from the starting point
        x = translate(x, 0.75);
        // Rotate the branch by the given angle
        x = rotate(x, theta);
        // Draw the branch
        draw(x);
        // Recursively call the branch function to draw a smaller branch on the left
        branch(len, angle, depth-1, LR);
        // Recursively call the branch function to draw a smaller branch on the right
        branch(len,-angle, depth-1, LR);
    end
endfunction

// Define a function to draw a line given a set of points
function x = draw(x)
    plot(x(1,:), x(2,:), 'blue', 'LineWidth', 1);
endfunction

// Define a function to translate a set of points by a certain percentage of their length
function y = translate(x, porcentage)
    // Calculate the new endpoint of the branch
    ratio = [x(1,2) - x(1,1); x(2,2) - x(2,1)]*(1+porcentage) + x(:,1);
    // Update the starting and ending points of the branch
    x(:,1) = x(:,2);
    x(:,2) = ratio;
    // Return the updated set of points
    y = x;
endfunction

// Define a function to rotate a set of points by a given angle
function y = rotate(x, theta)
    // Translate the set of points to the origin
    a = x(1,1);
    b = x(2,1);
    x(1,:) = x(1,:)-a;
    x(2,:) = x(2,:)-b;
    // Determine the rotation matrix based on the left/right orientation
    if LR == 1
        Rot = [cosd(theta) sind(theta); -sind(theta) cosd(theta)];
    else
        Rot = [cosd(theta) -sind(theta); sind(theta) cosd(theta)];
    end
    // Rotate the set of points and translate it back to its original position
    y = Rot*x + [a a; b b];
endfunction

// Set the initial parameters of the tree
len = 100;        // Length of the first branch
angle = 25;       // Angle of the branches from the trunk
depth = 9;        // Maximum depth of the recursion
x = [0 0; 0 len]; // Starting and ending points of the first branch

draw(x); // Draw the first branch
// Draw a branch on the left and the right using the branch function
branch(len, angle, depth, 1);
branch(len, angle, depth, 2);

