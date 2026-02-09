clc; clear; close all;

% Parameters
x = linspace(-2, 2, 1000);            % Domain
alpha_values = linspace(0, 20, 200);  % Animation steps

% Figure setup (Gold background)
figure('Color',[1 0.84 0])   % Gold color
grid on
xlabel('x','Color','k')
ylabel('y','Color','k')
xlim([-2 2])
ylim([-2 4])

% Set axis numbers (ticks) to black
set(gca, 'XColor', 'k', 'YColor', 'k')

% Centered two-line title in black
t = title({
    '😍 Can you be my Valentine 💖'
    '💖 Designed & Developed by HK 💝'
});
t.Color = 'k';
t.FontWeight = 'bold';

hold on

% Continuous animation loop
while ishandle(gcf)
    for i = 1:length(alpha_values)
        alpha = alpha_values(i);

        % Function definition
        y = nthroot(x,3).^2 + ...
            0.9 .* sin(alpha * pi * x) .* sqrt(4 - x.^2);

        % Clear previous frame
        cla
        grid on

        % Keep colors after cla
        set(gca, 'XColor', 'k', 'YColor', 'k')
        xlabel('x','Color','k')
        ylabel('y','Color','k')
        title(t.String,'Color','k','FontWeight','bold')

        % Plot curve
        plot(x, y, 'r', 'LineWidth', 2)

        % Fill for heart effect
        fill([x fliplr(x)], [y zeros(size(y))], ...
             'r', 'FaceAlpha', 0.3, 'EdgeColor', 'none')

        drawnow
    end
end