function ftShoesDataPlotter(bucket)
    optTotalWrench = false;
    wrenchVStime_plots = true;

    forceLabels  = {'Fx','Fy','Fz'};
    momentLabels = {'Mx','My','Mz'};
    
    %% Plots of single sensor wrench
    load(fullfile(bucket.pathToParsedTaskData,'shoes.mat'),'shoes');
    
    plotTitle = strcat(bucket.taskName,sprintf('-InSituOpt:%s',bucket.inSituOpt));
    figure('Name',plotTitle,'NumberTitle','off')
    
    %----LEFT FRONT
    subplot(421)  % forces
    for compIdx = 1 : 3
        if wrenchVStime_plots
            plot(shoes.Left.front.timeNormToZero,shoes.Left.front.forces(compIdx,:),'.');
        else
            plot(shoes.Left.front.forces(compIdx,:),'lineWidth',1.5);
        end
        ylabel('force','FontSize',17);
        if compIdx == 1
            title('FT left front','FontSize',17);
        end
        legendInfo{compIdx} = [forceLabels{compIdx}];
        hold on
    end
    legend(legendInfo,'Location','northeast', 'FontSize',18);
    
    subplot(423) % moments
    for compIdx = 1 : 3
        if wrenchVStime_plots
            plot(shoes.Left.front.timeNormToZero,shoes.Left.front.moments(compIdx,:),'.');
        else
            plot(shoes.Left.front.moments(compIdx,:),'lineWidth',1.5);
        end
        ylabel('moment','FontSize',17);
        legendInfo{compIdx} = [momentLabels{compIdx}];
        hold on
    end
    legend(legendInfo,'Location','northeast', 'FontSize',18);
    
    %----LEFT REAR
    subplot(425) % forces
    for compIdx = 1 : 3
        if wrenchVStime_plots
            plot(shoes.Left.rear.timeNormToZero,shoes.Left.rear.forces(compIdx,:),'.');
        else
            plot(shoes.Left.rear.forces(compIdx,:),'lineWidth',1.5);
        end
        ylabel('force','FontSize',17);
        if compIdx == 1
            title('FT left rear','FontSize',17);
        end
        legendInfo{compIdx} = [forceLabels{compIdx}];
        hold on
    end
    legend(legendInfo,'Location','northeast', 'FontSize',18);
    
    subplot(427) % moments
    for compIdx = 1 : 3
        if wrenchVStime_plots
            plot(shoes.Left.rear.timeNormToZero,shoes.Left.rear.moments(compIdx,:),'.');
            xlabel('abs time','FontSize',17);
        else
            plot(shoes.Left.rear.moments(compIdx,:),'lineWidth',1.5);
            xlabel('samples','FontSize',17);
        end
        ylabel('moment','FontSize',17);
        legendInfo{compIdx} = [momentLabels{compIdx}];
        hold on
    end
    legend(legendInfo,'Location','northeast', 'FontSize',18);
    
    %----RIGHT FRONT
    subplot(422)  % forces
    for compIdx = 1 : 3
        if wrenchVStime_plots
            plot(shoes.Right.front.timeNormToZero,shoes.Right.front.forces(compIdx,:),'.');
        else
            plot(shoes.Right.front.forces(compIdx,:),'lineWidth',1.5);
        end
        ylabel('force','FontSize',17);
        if compIdx == 1
            title('FT right front','FontSize',17);
        end
        legendInfo{compIdx} = [forceLabels{compIdx}];
        hold on
    end
    legend(legendInfo,'Location','northeast', 'FontSize',18);
    
    subplot(424) % moments
    for compIdx = 1 : 3
        if wrenchVStime_plots
            plot(shoes.Right.front.timeNormToZero,shoes.Right.front.moments(compIdx,:),'.');
        else
            plot(shoes.Right.front.moments(compIdx,:),'lineWidth',1.5);
        end
        ylabel('moment','FontSize',17);
        legendInfo{compIdx} = [momentLabels{compIdx}];
        hold on
    end
    legend(legendInfo,'Location','northeast', 'FontSize',18);
    
    %----RIGHT REAR
    subplot(426) % forces
    for compIdx = 1 : 3
        if wrenchVStime_plots
            plot(shoes.Right.rear.timeNormToZero,shoes.Right.rear.forces(compIdx,:),'.');
        else
            plot(shoes.Right.rear.forces(compIdx,:),'lineWidth',1.5);
        end
        ylabel('force','FontSize',17);
        if compIdx == 1
            title('FT right rear','FontSize',17);
        end
        legendInfo{compIdx} = [forceLabels{compIdx}];
        hold on
    end
    legend(legendInfo,'Location','northeast', 'FontSize',18);
    
    subplot(428) % moments
    for compIdx = 1 : 3
        if wrenchVStime_plots
            plot(shoes.Right.rear.timeNormToZero,shoes.Right.rear.moments(compIdx,:),'.');
            xlabel('abs time','FontSize',17);
        else
            plot(shoes.Right.rear.moments(compIdx,:),'lineWidth',1.5);
            xlabel('samples','FontSize',17);
        end
        ylabel('moment','FontSize',17);
        legendInfo{compIdx} = [momentLabels{compIdx}];
        hold on
    end
    legend(legendInfo,'Location','northeast', 'FontSize',18);
    
end