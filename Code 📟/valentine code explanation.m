clc; clear; close all;   % Clear command window, workspace, and close all figures

% ================================
% Parameters
% ================================
x = linspace(-2, 2, 1000);            % Domain for x values from -2 to 2 (1000 points)
alpha_values = linspace(0, 20, 200);  % Animation parameter alpha (200 steps from 0 to 20)

% ================================
% Figure setup
% ================================
figure('Color',[1 0.84 0])   % Create figure with gold background
grid on                       % Turn on grid
xlabel('x','Color','k')       % x-axis label in black
ylabel('y','Color','k')       % y-axis label in black
xlim([-2 2])                  % x-axis limits
ylim([-2 4])                  % y-axis limits

% Set axis ticks color to black
set(gca, 'XColor', 'k', 'YColor', 'k')

% Centered two-line title in black and bold
t = title({
    '😍 Can you be my Valentine 💖'   % First line of the title
    '💖 Designed & Developed by HK 💝' % Second line of the title
});
t.Color = 'k';          % Title color
t.FontWeight = 'bold';  % Title font weight

hold on  % Keep plots on the same figure

% ================================
% Continuous animation loop
% ================================
while ishandle(gcf)  % Keep running as long as the figure window exists
    for i = 1:length(alpha_values)
        alpha = alpha_values(i);  % Current animation step

        % ----------------------------
        % Function definition
        % ----------------------------
        y = nthroot(x,3).^2 + ...                       % Cube root of x squared
            0.9 .* sin(alpha * pi * x) .* sqrt(4 - x.^2);  % Oscillating term for heart-like effect

        % ----------------------------
        % Clear previous frame
        % ----------------------------
        cla  % Clear current axes
        grid on  % Re-enable grid

        % Reapply axes and labels (since cla resets them)
        set(gca, 'XColor', 'k', 'YColor', 'k')
        xlabel('x','Color','k')
        ylabel('y','Color','k')
        title(t.String,'Color','k','FontWeight','bold')

        % ----------------------------
        % Plot curve
        % ----------------------------
        plot(x, y, 'r', 'LineWidth', 2)  % Red curve with thicker line

        % ----------------------------
        % Fill for heart effect
        % ----------------------------
        fill([x fliplr(x)], [y zeros(size(y))], ... % Fill area under the curve
             'r', 'FaceAlpha', 0.3, 'EdgeColor', 'none') % Semi-transparent red

        drawnow  % Update figure immediately for animation
    end
end