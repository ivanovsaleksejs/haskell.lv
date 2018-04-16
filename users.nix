
  users.users = {
    root = {
      openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdQTg3/08c0FeapBUcsypdHc57Mjx3P0zBuuUVcfg//s8Y7gYt02Rjli7meBqf34TOc5AbARkX32B8OaWHLw4UZ9u1WAkOJ6xAROmWTh+hR0poGDcGtIhCUgXCniaJ7WfoASX0EZF5L6GfrCXAF+uqCohSd2SfGW+tIusf8nhAbxGr+p/5Dk8FfB/QUZvmsmdHV6aJmSUACDcOc9qh+Lks2POcpj3xukFdv6LC4C/E2q227hfvK2+rIuV0RNTyTIzPBZD1TZen66p1Ty4eDP+lvsVJaarTYkdpb1wwKiYZzfxLAqLD9eJa2TifgZKhTg4zZbBJEgBva9ujpwzUh7tn aleksejs@nixos" ];
    };
    aleksejs = {
      isSystemUser = true;
      createHome = true;
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdQTg3/08c0FeapBUcsypdHc57Mjx3P0zBuuUVcfg//s8Y7gYt02Rjli7meBqf34TOc5AbARkX32B8OaWHLw4UZ9u1WAkOJ6xAROmWTh+hR0poGDcGtIhCUgXCniaJ7WfoASX0EZF5L6GfrCXAF+uqCohSd2SfGW+tIusf8nhAbxGr+p/5Dk8FfB/QUZvmsmdHV6aJmSUACDcOc9qh+Lks2POcpj3xukFdv6LC4C/E2q227hfvK2+rIuV0RNTyTIzPBZD1TZen66p1Ty4eDP+lvsVJaarTYkdpb1wwKiYZzfxLAqLD9eJa2TifgZKhTg4zZbBJEgBva9ujpwzUh7tn aleksejs@nixos"
      ];
    };
    s = {
      isSystemUser = true;
      createHome = true;
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [
        "sh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDwHcSSm2TdzOwXEG6BLdhjOtHKHect9NIHn3uFm4i32irEBE89uSeZomVjOBYppFaGhKiyTGm+BsHXUq79lMZwQfZTjJyJMUwBE3is8M3FmuF0oBSsjtIYZM5tDOfBX12EuWjxrPDwzqQnCY95RXs05BljxvsBEoDBnUyYR4jbszzU+Xtk9/UdUGUnabGwvbQxIEd0JuOljOz2NNa5pWc8KwlqoqLdOeaIHMDMRnEt9bmGZjiVhkYPdxJfvxL+x4LfdSeidOaQhVRgFGmG5wCrj2/nQWffKL+hGaBSzPcy49qWTM/P2232FTkayCP1pBediE/iewmliaBFsFAFSO8x ij@self"
      ];
    };
  };
