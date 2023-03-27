import * as React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import Typography from '@material-ui/core/Typography';
import { MilitaryTech } from '@mui/icons-material';

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    marginTop: theme.spacing(5),
  },
  paper: {
    padding: theme.spacing(5),
    textAlign: 'center',
    color: '#000',
    height: '100%',
    backgroundColor: '#FCBD2A',
    
  },
  bold: {
    fontWeight: 'bold',
    fontSize: '2rem',
    
  },
  bigger: {
    fontSize: '1.6rem',
    
  },
  gold: {
    
    fontWeight: 'bold',
    fontSize: '1.4rem',
    
  },
  silver: {
    
    fontWeight: 'bold',
    fontSize: '1.2rem',
    
  },
  bronze: {
    
    fontWeight: 'bold',
    fontSize: '1rem',
    
  }
}));

export default function TopUsers({ totalUsers, highestScore, top3Users }: { totalUsers: number, highestScore: number, top3Users: Array<{username: string, points: number}> }) {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <Grid container spacing={2}>
        <Grid item xs={4}>
          <Paper className={classes.paper}>
            <Typography variant="h5" className={`${classes.bold}`}>Total Players</Typography>
            <Typography className={` ${classes.bigger}`}>{totalUsers}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={4}>
          <Paper className={classes.paper}>
            <Typography variant="h5" className={`${classes.bold}`}>Top Score</Typography>
            <Typography className={` ${classes.bigger}`}>{highestScore}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={4}>
          <Paper className={classes.paper}>
            <Typography variant="h5" className={`${classes.bold}`}>Top 3 Scores</Typography>
            {top3Users.map((user, index) => (
              <Typography key={index} className={index === 0 ? classes.gold : index === 1 ? classes.silver : classes.bronze}>
                {user.username} - {user.points} {index === 0 && <MilitaryTech sx={{textShadow: '1px 1px 3px #1C0C08'}} />}
              </Typography>
            ))}
          </Paper>
        </Grid>
      </Grid>
    </div>
  );
}
